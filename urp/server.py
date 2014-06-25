import tornado.web
from tornado import gen
import motor
from zmq.eventloop import ioloop
ioloop.install()

import clonesrv5


class MainHandler(tornado.web.RequestHandler):
    @tornado.web.asynchronous
    @gen.coroutine
    def post(self):
        """Insert a message."""
        msg = self.get_argument('msg')
        db = self.settings['db']

        yield db.messages.insert({'msg': msg})

        # Success
        self.redirect('/msgs')

    @tornado.web.asynchronous
    @gen.coroutine
    def get(self):
        """Display all messages."""
        self.write('<a href="/msgs">Compose a message</a><br>')
        self.write('<ul>')
        db = self.settings['db']
        cursor = db.messages.find().sort([('_id', -1)])
        while (yield cursor.fetch_next):
            message = cursor.next_object()
            self.write('<li>%s</li>' % message['msg'])

        # Iteration complete
        self.write('</ul>')
        self.finish()

db = motor.MotorClient().pyuss

application = tornado.web.Application([
    (r'/msgs', MainHandler)
], db=db)


def main():
    application.listen(8888)
    clone = clonesrv5.CloneServer(tornado.ioloop.IOLoop.instance())
    clone.start()


if __name__ == '__main__':
    main()
