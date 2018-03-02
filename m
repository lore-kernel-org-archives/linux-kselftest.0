From: mike.kravetz@oracle.com (Mike Kravetz)
Date: Fri, 2 Mar 2018 15:26:40 -0800
Subject: [PATCH] selftests/vm/run_vmtests: adjust hugetlb size accroding
 to nr_cpus
In-Reply-To: <20180302024356.83359-1-zhijianx.li@intel.com>
References: <20180302024356.83359-1-zhijianx.li@intel.com>
Message-ID: <27de0b4e-d75b-a71d-c45c-1d84bc7e6e9e@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180302232640.xhBa5kMZKZyQ4mQk8v_pLtKvX4S5K7EvVnM1XkYZ_Go@z>

On 03/01/2018 06:43 PM, Li Zhijian wrote:
> this patch is to fix running userfaultfd_hugetlb failed on the host which has
> more than 64 cpus
> ---------------------------
> running userfaultfd_hugetlb
> ---------------------------
> invalid MiB
> Usage: <MiB> <bounces>
> [FAIL]
> 
> From userfaultfd.c we can know, hugetlb_size need to meet hugetlb_size >= nr_cpus * hugepage_size
> hugepage_size is often 2M, so when host cpus > 64, it requires more than 128M.
> 
> Signed-off-by: Li Zhijian <zhijianx.li at intel.com>

Thanks for fixing this.

> ---
>  tools/testing/selftests/vm/run_vmtests | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
> index d2561895a021a..c440fb972afe9 100755
> --- a/tools/testing/selftests/vm/run_vmtests
> +++ b/tools/testing/selftests/vm/run_vmtests
> @@ -2,8 +2,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  #please run as root
>  
> -#we need 256M, below is the size in kB
> -needmem=262144
>  mnt=./huge
>  exitcode=0
>  
> @@ -17,6 +15,13 @@ while read name size unit; do
>  	fi
>  done < /proc/meminfo
>  
> +nr_cpus=$(nproc)
> +pgsize_MB=$((pgsize/1024))
> +# rule: nr_cpus * pgsize_MB <= hugetlb_size(round to 128M for testing)
> +hugetlb_size=$((((nr_cpus*pgsize_MB+127)/128)*128))
> +# needmem depends on the nr_cpus, below is the size in kB
> +needmem=$((hugetlb_size*2*1024))
> +
>  #set proper nr_hugepages
>  if [ -n "$freepgs" ] && [ -n "$pgsize" ]; then
>  	nr_hugepgs=`cat /proc/sys/vm/nr_hugepages`
> @@ -107,8 +112,8 @@ fi
>  echo "---------------------------"
>  echo "running userfaultfd_hugetlb"
>  echo "---------------------------"
> -# 256MB total huge pages == 128MB src and 128MB dst
> -./userfaultfd hugetlb 128 32 $mnt/ufd_test_file
> +# 256MB total huge pages == 128MB src and 128MB dst when nr_cpus <= 64
> +./userfaultfd hugetlb $hugetlb_size 32 $mnt/ufd_test_file
>  if [ $? -ne 0 ]; then
>  	echo "[FAIL]"
>  	exitcode=1

The above changes are functionally OK.  But, I think something like the
following may be easier to read/understand.  Feel free to use as much or
little as you would like.
-- 
Mike Kravetz

Signed-off-by: Mike Kravetz <mike.kravetz at oracle.com>
---
 tools/testing/selftests/vm/run_vmtests | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/vm/run_vmtests b/tools/testing/selftests/vm/run_vmtests
index d2561895a021..40671f6739a9 100755
--- a/tools/testing/selftests/vm/run_vmtests
+++ b/tools/testing/selftests/vm/run_vmtests
@@ -2,25 +2,33 @@
 # SPDX-License-Identifier: GPL-2.0
 #please run as root
 
-#we need 256M, below is the size in kB
-needmem=262144
 mnt=./huge
 exitcode=0
 
-#get pagesize and freepages from /proc/meminfo
+#get huge pagesize and freepages from /proc/meminfo
 while read name size unit; do
 	if [ "$name" = "HugePages_Free:" ]; then
 		freepgs=$size
 	fi
 	if [ "$name" = "Hugepagesize:" ]; then
-		pgsize=$size
+		hpgsize_KB=$size
 	fi
 done < /proc/meminfo
 
+# Simple hugetlbfs tests have a hardcoded minimum requirement of
+# huge pages totaling 256MB (262144KB) in size.  The userfaultfd
+# hugetlb test requires a minimum of 2 * nr_cpus huge pages.  Take
+# both of these requirements into account and attempt to increase
+* number of huge pages available.
+nr_cpus=$(nproc)
+hpgsize_MB=$((hpgsize_KB / 1024))
+half_ufd_size_MB=$((((nr_cpus * hpgsize_MB + 127) / 128) * 128))
+needmem_KB=$((half_ufd_size_MB * 2 * 1024))
+
 #set proper nr_hugepages
-if [ -n "$freepgs" ] && [ -n "$pgsize" ]; then
+if [ -n "$freepgs" ] && [ -n "$hpgsize_KB" ]; then
 	nr_hugepgs=`cat /proc/sys/vm/nr_hugepages`
-	needpgs=`expr $needmem / $pgsize`
+	needpgs=$((needmem_KB / hpgsize_KB))
 	tries=2
 	while [ $tries -gt 0 ] && [ $freepgs -lt $needpgs ]; do
 		lackpgs=$(( $needpgs - $freepgs ))
@@ -107,8 +115,9 @@ fi
 echo "---------------------------"
 echo "running userfaultfd_hugetlb"
 echo "---------------------------"
-# 256MB total huge pages == 128MB src and 128MB dst
-./userfaultfd hugetlb 128 32 $mnt/ufd_test_file
+# Test requires source and destination huge pages.  Size of source
+# (half_ufd_size_MB) is passed as argument to test.
+./userfaultfd hugetlb $half_ufd_size_MB 32 $mnt/ufd_test_file
 if [ $? -ne 0 ]; then
 	echo "[FAIL]"
 	exitcode=1
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
