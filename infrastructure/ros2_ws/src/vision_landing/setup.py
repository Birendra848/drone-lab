from setuptools import find_packages, setup

package_name = 'vision_landing'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Birendra Kumar',
    maintainer_email='kbirendra848@gmail.com',
    description='Vision package for autonomous UAV landing research',
    license='MIT',
    extras_require={
        'test': [
            'pytest',
        ],
    },
    entry_points={
    'console_scripts': [
        'camera_viewer = vision_landing.nodes.camera_viewer_node:main',
    ],
    },
)
