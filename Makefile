setup:bootstrap install-pod

bootstrap:
	carthage bootstrap --platform iOS --cache-builds

update-pod:install-gem
	cd Demo; bundle exec pod repo update
	cd Demo; bundle exec pod install

install-pod:install-gem
	cd Demo; bundle exec pod install

install-gem:
	cd Demo; bundle install --path vendor/bundle
