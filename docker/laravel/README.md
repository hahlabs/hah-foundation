#Building Image
build shams first before alpha takes approximately 45m on TURNADO

This docker container should have
1. nginx runs on port 8201 <default nginx site>
2. php 8.2
3. GCP rpc
4. Composer
5. XDebugger

Match set-env.sh/RELEASE with Dockerfile.laravel.alpha/version.hahlabs-laravel

Process to build the image
1. ./build-run core
2. ./build-run [alpha]
3. ./test-image [alpha | core]
4. ./publish-image [core|  alpha ]
