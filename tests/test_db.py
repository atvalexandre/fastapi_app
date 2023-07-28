from sqlalchemy import select

from fast_zero.models import User


def test_create_user(session):
    new_user = User(
        username='xandao', password='secret', email='atvalexandre@test'
    )
    session.add(new_user)
    session.commit()

    user = session.scalar(select(User).where(User.username == 'xandao'))

    assert user.username == 'xandao'
