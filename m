From: dan.rue at linaro.org (Dan Rue)
Date: Mon, 26 Nov 2018 21:12:14 -0600
Subject: [PATCH 0/2] selftests: firmware: fw_filesystem fix for busybox
Message-ID: <20181127031218.24419-1-dan.rue@linaro.org>

Fix fw_filesystem.sh to run in an automated environment under busybox.

After this change, fw_run_tests.sh still fails at some point in fw_fallback.sh,
with error "usermode helper disabled so ignoring test". This is coming from
fw_lib.sh:verify_reqs() because $HAS_FW_LOADER_USER_HELPER is set to no.

Dan Rue (2):
  selftests: firmware: remove use of non-standard diff -Z option
  selftests: firmware: add CONFIG_FW_LOADER_USER_HELPER_FALLBACK to
    config

 tools/testing/selftests/firmware/config           | 1 +
 tools/testing/selftests/firmware/fw_filesystem.sh | 9 +++------
 2 files changed, 4 insertions(+), 6 deletions(-)

-- 
2.19.1
