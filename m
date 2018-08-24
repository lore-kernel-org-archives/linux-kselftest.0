From: anders.roxell@linaro.org (Anders Roxell)
Date: Fri, 24 Aug 2018 14:49:41 +0200
Subject: [PATCH v2] selftests: android: move config up a level
Message-ID: <20180824124941.10146-1-anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180824124941.-JySRbaO4IP4GpanAxhwZntnUfF9u48aiM_AUoyA1nU@z>

'make kselftest-merge' assumes that the config files for the tests are
located under the 'main' test dir, like tools/testing/selftests/android/
and not in a subdir to android.

Signed-off-by: Anders Roxell <anders.roxell at linaro.org>
---
 tools/testing/selftests/android/{ion => }/config | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename tools/testing/selftests/android/{ion => }/config (100%)

diff --git a/tools/testing/selftests/android/ion/config b/tools/testing/selftests/android/config
similarity index 100%
rename from tools/testing/selftests/android/ion/config
rename to tools/testing/selftests/android/config
-- 
2.11.0
