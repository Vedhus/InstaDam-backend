import datetime as dt
from ..app import db

class Project(db.Model):
    """Class Project is a database model to represent a project

    Specifies the full database schema of the table 'projects'

    Attributes:
        id: unique integer id given to a user (primary key)
        project_name: unique string that represents name of the project
        created_by: integer to represent id of user who created project
        created_at: datetime to represent date at which project was created
    """

    __tablename__ = 'projects'
    id = db.Column(db.Integer, primary_key=True)
    project_name = db.Column(db.String(64), unique=True, nullable=False)
    created_by = db.Column(db.Integer, nullable=False)
    created_at = db.Column(db.Datetime, nullable=False, default=dt.datetime.utcnow)

    def __repr__(self):
        return '<Project: %r>' % self.project_name