build:
	docker build -t ianblenke/ceph-dashboard .

run:
	docker run --rm --name ceph-dashboard --volumes-from deis-store-monitor-data ianblenke/ceph-dashboard
