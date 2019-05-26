import os
import os.path

# fail fast if a required env var is not provided

PROJECT_ROOT = os.path.expanduser(os.path.expandvars(os.environ['QCBRUNCH_ROOT']))

SOURCE_DIR = PROJECT_ROOT

BUILD_DIR = os.path.join(PROJECT_ROOT, 'build')
