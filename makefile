PHONY: run, env, generate, lcov, scrape

UNAME_S := $(shell uname -s)

package := false

analyze:
	@flutter analyze --no-fatal-infos --no-pub ./lib

prepare:
	@flutter pub get && dart run husky install

run:
	@flutter run --flavor dev

generate:
	@dart run build_runner build --delete-conflicting-outputs

env:
ifeq ($(UNAME_S), Darwin)
	@./cli/trident-mac generate-config -ns aquaheromobile -tmpl ./env.template -dest ./.env
else ifeq ($(UNAME_S), Linux)
	@./cli/trident generate-config -ns aquaheromobile -tmpl ./env.template -dest ./.env
else
	@echo $(UNAME_S)
endif

lcov:
	@./test_coverage.sh

firebase:
ifeq ($(UNAME_S), Darwin)
	@./cli/trident-mac generate-config -ns aquaheromobile -tmpl ./google-services.template -dest ./android/app/google-services.json
	@./cli/trident-mac generate-config -ns aquaheromobile -tmpl ./firebase_app_id_file.template -dest ./ios/firebase_app_id_file.json
else ifeq ($(UNAME_S), Linux)
	@./cli/trident generate-config -ns aquaheromobile -tmpl ./google-services.template -dest ./android/app/google-services.json
	@./cli/trident generate-config -ns aquaheromobile -tmpl ./firebase_app_id_file.template -dest ./ios/firebase_app_id_file.json
else
	@echo $(UNAME_S)
endif

PHONY: scrape_icons, scrape_typography, scrape_color, scrape_spacing, scrape_illustration
scrape_icons:
	@dart run scylla/script/scrape_icons.dart

scrape_typography:
	@dart run scylla/script/scrape_typography.dart

scrape_color:
	@dart run scylla/script/scrape_colors.dart

scrape_spacing:
	@dart run scylla/script/scrape_spacing.dart

scrape_illustration:
	@dart run scylla/script/scrape_illustrations.dart

scrape: scrape_icons scrape_typography scrape_color scrape_spacing scrape_illustration

