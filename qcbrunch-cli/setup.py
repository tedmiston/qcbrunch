from setuptools import find_packages, setup

setup(
    name='qcbrunch',
    version='0.1.0',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'Click==7.0',
        'PyYAML==5.1',
    ],
    entry_points='''
        [console_scripts]
        qcbrunch=qcbrunchcli.main:cli
    ''',
)
