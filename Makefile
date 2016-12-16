
check:
	./gradlew clean check bintrayUpload # default to dry-run

publish: check
	./gradlew releng
	./gradlew -PdryRun=false --info annotations:bintrayUpload || echo 'Failure!'
	./gradlew -PdryRun=false --info processor:bintrayUpload || echo 'Failure!'
	./gradlew -PdryRun=false --info migration:bintrayUpload || echo 'Failure!'
	./gradlew -PdryRun=false --info library:bintrayUpload || echo 'Failure!'
