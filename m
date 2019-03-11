From: pvorel at suse.cz (Petr Vorel)
Date: Mon, 11 Mar 2019 22:51:15 +0100
Subject: [PATCH v3 0/7] selftests/ima: add kexec and kernel module tests
In-Reply-To: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
References: <1552304473-3966-1-git-send-email-zohar@linux.ibm.com>
Message-ID: <20190311215115.GB13024@x230>

Hi Mimi,

> Mimi Zohar (6):
>   selftests/ima: cleanup the kexec selftest
>   selftests/ima: define a set of common functions
>   selftests/ima: define common logging functions
>   kselftest/ima: define "require_root_privileges"
>   selftests/ima: kexec_file_load syscall test
>   selftests/ima: loading kernel modules
Whole patchset LGTM.
Reviewed-by: Petr Vorel <pvorel at suse.cz>

> Petr Vorel (1):
>   selftests/ima: Add missing '=y' to config options

>  tools/testing/selftests/ima/Makefile               |   3 +-
>  tools/testing/selftests/ima/config                 |   7 +-
>  tools/testing/selftests/ima/ima_common_lib.sh      | 173 +++++++++++++++++++
>  tools/testing/selftests/ima/test_kernel_module.sh  |  93 ++++++++++
>  .../testing/selftests/ima/test_kexec_file_load.sh  | 190 +++++++++++++++++++++
>  tools/testing/selftests/ima/test_kexec_load.sh     |  53 ++----
>  6 files changed, 476 insertions(+), 43 deletions(-)
>  create mode 100755 tools/testing/selftests/ima/ima_common_lib.sh
>  create mode 100755 tools/testing/selftests/ima/test_kernel_module.sh
>  create mode 100755 tools/testing/selftests/ima/test_kexec_file_load.sh


Kind regards,
Petr
