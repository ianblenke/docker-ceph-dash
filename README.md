# docker-ceph-dash

This is a Dockerfile project to dockerize [Crapworks/ceph-dash](https://github.com/Crapworks/ceph-dash).

This is an autobuild project for the docker hub image [ianblenke/ceph-dash](https://registry.hub.docker.com/u/ianblenke/ceph-dash/).

You can build this yourself locally using standard docker build syntax:

	docker build -t `whoami`/ceph-dashboard .

If you have a Deis cluster, for example, you can run this and get a ceph dashboard:

	docker run --rm --name ceph-dashboard -p 15000:5000 --volumes-from deis-store-monitor-data ianblenke/ceph-dashboard

Along with that, you would need to tell deis-router a little about it:

    . /etc/environment
    echo -n ${COREOS_PRIVATE_IPV4}:15000 | etcdctl set /deis/services/ceph-dash/ceph-dash.1

You should then be able to open a browser to ceph-dash at your wildcard domain, ie: http://ceph-dash.example.com

_Alternatively_, there is a [ceph-dash-deis.cloud-init](https://github.com/ianblenke/docker-ceph-dash/blob/master/ceph-dash-deis.cloud-init) in this project that can be used to install this as a fleet unit:

    sudo coreos-cloudinit --from-file=ceph-dash-deis.cloud-init

Or simply add the contents of this file to your [Deis](http://deis.io) cloud-init user-data yaml file.

You could also probably PaaS deploy this with some effort. If you manage that, please fork this project and generate a PR with some instructions!
