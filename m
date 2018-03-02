From: zhijianx.li at intel.com (Li Zhijian)
Date: Fri,  2 Mar 2018 10:43:56 +0800
Subject: [PATCH] selftests/vm/run_vmtests: adjust hugetlb size accroding to
 nr_cpus
Message-ID: <20180302024356.83359-1-zhijianx.li@intel.com>

this patch is to fix running userfaultfd_hugetlb failed on the host which has
more than 64 cpus
---------------------------
running userfaultfd_hugetlb
---------------------------
invalid MiB
Usage: <MiB> <bounces>
[FAIL]

>From userfaultfd.c we can know, hugetlb_size need to meet hugetlb_size >= nr_cpus * hugepage_size
hugepage_size is often 2M, so when host cpus > 64, it requires more than 128M.

Signed-off-by: Li Zhijian <zhijianx.li at intel.com>
---
 tools/testing/selftests/vm/run_vmtests | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
index d2561895a021a..c440fb972afe9 100755
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@ -2,8 +2,6 @@
 # SPDX-License-Identifier: GPL-2.0
 #please run as root
 
-#we need 256M, below is the size in kB
-needmem=262144
 mnt=./huge
 exitcode=0
 
@@ -17,6 +15,13 @@ while read name size unit; do
 	fi
 done < /proc/meminfo
 
+nr_cpus=$(nproc)
+pgsize_MB=$((pgsize/1024))
+# rule: nr_cpus * pgsize_MB <= hugetlb_size(round to 128M for testing)
+hugetlb_size=$((((nr_cpus*pgsize_MB+127)/128)*128))
+# needmem depends on the nr_cpus, below is the size in kB
+needmem=$((hugetlb_size*2*1024))
+
 #set proper nr_hugepages
 if [ -n "$freepgs" ] && [ -n "$pgsize" ]; then
 	nr_hugepgs=`cat /proc/sys/vm/nr_hugepages`
@@ -107,8 +112,8 @@ fi
 echo "---------------------------"
 echo "running userfaultfd_hugetlb"
 echo "---------------------------"
-# 256MB total huge pages == 128MB src and 128MB dst
-./userfaultfd hugetlb 128 32 $mnt/ufd_test_file
+# 256MB total huge pages == 128MB src and 128MB dst when nr_cpus <= 64
+./userfaultfd hugetlb $hugetlb_size 32 $mnt/ufd_test_file
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
 	exitcode=1
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
