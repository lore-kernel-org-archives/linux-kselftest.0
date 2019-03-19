From: zhangxiaoxu5 at huawei.com (ZhangXiaoxu)
Date: Tue, 19 Mar 2019 11:24:31 +0800
Subject: [PATCH] selftests: efivarfs: remove the test_create_read file if it
 was exist
Message-ID: <1552965871-77209-1-git-send-email-zhangxiaoxu5@huawei.com>

After the first run, the test case 'test_create_read' will always
fail because the file is exist and file's attr is 'S_IMMUTABLE',
open with 'O_RDWR' will always return -EPERM.

Signed-off-by: ZhangXiaoxu <zhangxiaoxu5 at huawei.com>
---
 tools/testing/selftests/efivarfs/efivarfs.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/efivarfs/efivarfs.sh b/tools/testing/selftests/efivarfs/efivarfs.sh
index a47029a..d386610 100755
--- a/tools/testing/selftests/efivarfs/efivarfs.sh
+++ b/tools/testing/selftests/efivarfs/efivarfs.sh
@@ -77,6 +77,10 @@ test_create_empty()
 test_create_read()
 {
 	local file=$efivarfs_mount/$FUNCNAME-$test_guid
+	if [ -f $file]; then
+		chattr -i $file
+		rm -rf $file
+	fi
 	./create-read $file
 }
 
-- 
2.7.4
