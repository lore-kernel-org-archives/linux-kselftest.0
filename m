From: po-hsu.lin at canonical.com (Po-Hsu Lin)
Date: Fri, 19 Apr 2019 22:04:49 +0800
Subject: [PATCHv3] selftests/efivarfs: clean up test files from test_create*()
Message-ID: <20190419140449.31259-1-po-hsu.lin@canonical.com>

Test files created by test_create() and test_create_empty() tests will
stay in the $efivarfs_mount directory until the system was rebooted.

When the tester tries to run this efivarfs test again on the same
system, the immutable characteristics in that directory will cause some
"Operation not permitted" noises, and a false-positve test result as the
file was created in previous run.
    --------------------
    running test_create
    --------------------
    ./efivarfs.sh: line 59: /sys/firmware/efi/efivars/test_create-210be57c-9849-4fc7-a635-e6382d1aec27: Operation not permitted
      [PASS]
    --------------------
    running test_create_empty
    --------------------
    ./efivarfs.sh: line 78: /sys/firmware/efi/efivars/test_create_empty-210be57c-9849-4fc7-a635-e6382d1aec27: Operation not permitted
     [PASS]
    --------------------

Create a file_cleanup() to remove those test files in the end of each
test to solve this issue.

For the test_create_read, we can move the clean up task to the end of
the test to ensure the system is clean.

Also, use this function to replace the existing file removal code.

Signed-off-by: Po-Hsu Lin <po-hsu.lin at canonical.com>
---
 tools/testing/selftests/efivarfs/efivarfs.sh | 32 +++++++++++-----------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index d386610..a90f394 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -7,6 +7,12 @@ test_guid=210be57c-9849-4fc7-a635-e6382d1aec27
 # Kselftest framework requirement - SKIP code is 4.
 ksft_skip=4
 
+file_cleanup()
+{
+	chattr -i $1
+	rm -f $1
+}
+
 check_prereqs()
 {
 	local msg="skip all tests:"
@@ -58,8 +64,10 @@ test_create()
 
 	if [ $(stat -c %s $file) -ne 5 ]; then
 		echo "$file has invalid size" >&2
+		file_cleanup $file
 		exit 1
 	fi
+	file_cleanup $file
 }
 
 test_create_empty()
@@ -72,16 +80,14 @@ test_create_empty()
 		echo "$file can not be created without writing" >&2
 		exit 1
 	fi
+	file_cleanup $file
 }
 
 test_create_read()
 {
 	local file=$efivarfs_mount/$FUNCNAME-$test_guid
-	if [ -f $file]; then
-		chattr -i $file
-		rm -rf $file
-	fi
 	./create-read $file
+	file_cleanup $file
 }
 
 test_delete()
@@ -96,11 +102,7 @@ test_delete()
 		exit 1
 	fi
 
-	rm $file 2>/dev/null
-	if [ $? -ne 0 ]; then
-		chattr -i $file
-		rm $file
-	fi
+	file_cleanup $file
 
 	if [ -e $file ]; then
 		echo "$file couldn't be deleted" >&2
@@ -154,11 +156,7 @@ test_valid_filenames()
 			echo "$file could not be created" >&2
 			ret=1
 		else
-			rm $file 2>/dev/null
-			if [ $? -ne 0 ]; then
-				chattr -i $file
-				rm $file
-			fi
+			file_cleanup $file
 		fi
 	done
 
@@ -191,11 +189,7 @@ test_invalid_filenames()
 
 		if [ -e $file ]; then
 			echo "Creating $file should have failed" >&2
-			rm $file 2>/dev/null
-			if [ $? -ne 0 ]; then
-				chattr -i $file
-				rm $file
-			fi
+			file_cleanup $file
 			ret=1
 		fi
 	done
-- 
2.7.4
