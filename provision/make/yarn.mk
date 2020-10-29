#
# See ./CONTRIBUTING.rst
#
yarn.help:
	@echo '    yarn:'
	@echo ''
	@echo '        yarn                       command=(build|dev|start|export)'
	@echo '        yarn.setup                 Install dependences of project'
	@echo '        yarn.install               Install dependences'
	@echo ''

# setup download and install dependence.
.PHONY: yarn.setup
yarn.setup:
	@echo "----> setup dependence yarn..."
	yarn install
	@echo ${MESSAGE_HAPPY}

yarn.install:
	$(docker-yarn-run) yarn install

yarn:
	@if [ -z "${command}" ]; then \
		make yarn.help;\
	fi
	@if [ -n "${command}" ]; then \
		mkdir -p public;\
		$(docker-yarn-run) yarn ${command};\
	fi
