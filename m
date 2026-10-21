Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619452;
	b=F4ksidtELSxzx4W8gqhSxTKzUmby4aw86Y/uB3y4/QC+k6WWTOonPxYCAQXpG4jwRttk
	 CYgWXkUU6qnZbNLYVKU6cv0LYUKyjdpn0PAdnoKBQYCKLo5ztg+4TtY0ecOB72dtBi+Ul
	 PxpImw7W0SWmt6vLluRFnRez8ouJA/ydW8keDEDaamPgQBBehjq7L0NNWmNtG0VPRBBkL
	 nLx/iWdPUuyNb1tEQAW0TJiZMDKazZDbefYWDNAyWjxA2uWX/HICetABd8+3ssIoDcSYK
	 dj6uGfgOUlU+fFrVQf/wwpl+FTF0644lIixpslHA7gWVfw9BIJwNDkEdPS/V5KJ8XCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iNVbIqY0np3EFl5r02H57aH+C95nGImopBoQIdWCOEE=;
	b=49e/VBbW7pScCXeuUaubYarYVMZ5FYF1QFf/aSWmLIKfCnI1ux6WYhcLRkVgU/G6W2t+
	 ZRtBKkNtJb9IeDSvpxIS7VJ5Sa0S+ExjZCaXA403VOCtEizIWcEdPli6u5ei0G/Va9QeQ
	 SxGTTPfgT5N0oSFOawE2Vq+M6rTOCyhmfU5DvF20geZ/PNOP03o990VXa/LMavTs7fGpD
	 9lhYv3YlypKjJLJNXyBXUGu2a4Gw1d2WBYC2zxbdq0/5hJWzUwz3kW8PuRM/A25VwGyvs
	 rqEdCiRxnVFU9dWAvN9iW9sM6Yrg/p9U0e+d47zsgYGOxAcS3ofSluU4VqPdrU8+L1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=P8sMRjQS;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25D6606A31A
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B25D6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=P8sMRjQS
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-705cb6cedd5so195713eaf.1
        for <linux-kselftest@vger.kernel.org>; Wed, 21 Oct 2026 14:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1792619450; x=1793224250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNVbIqY0np3EFl5r02H57aH+C95nGImopBoQIdWCOEE=;
        b=P8sMRjQSlKY+E/heqfjcKfCDVd1BrkkUZWZs/wnhB9Chrkz6f+EKDA18pe+oioL2wF
         41dczgsQ9C/VtMYutUSdAyN+y0q5JLXhhescZfSA4DqyOgwYaaBxfsDhx6iaErMyFDma
         pxyMG6SihyqW4bBOBx2i7mTE8zZTjz6BOcFdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619450; x=1793224250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNVbIqY0np3EFl5r02H57aH+C95nGImopBoQIdWCOEE=;
        b=piMSsNXjKcQWfM5eLbikJm3lRYDp2WMYodo0OPktP+Hfq42z1/aYJTUEVB2DL0i4ss
         Xk7fVlhEDOUYx/YbXVKLj5UNBAKSqPRmInCx/oE4VEW7QlKmD0P+h8SMvdjE1wRZvMyS
         qQeuEFWRP/9+zbvrZ8AYSPINsii9cBEwXWAeB9YZK6yXBOeJgShQkP397xdFdtBsyquS
         R9D1TJAH/fe14TSBJUnKiO3HfPFYdxr+kqRO+PZ+64v2zku52o0z6kdZknOX43QQZqrk
         t/rC85+JObbn3UpE6rRG8AZy0GLl5k1W9uCZUB+numW3+tR2JnrUTDhfEfyHShvsIsMO
         TaHQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2F7iiSBPgBUx+yEkVhb6V9X4gQfiQUcPDdClGvdFFmTCUPDv6631K/b/5/s4ad78luTzMmIW5/HYTITcu5GI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJixi8Z+ehaTfjxRn44x6dgOVvq/HUJqsMVpSYCnevply4kwBRK
	kqudMHZapLdUo2EYGOLNDDs6OWtQdI2nRGolqlQ697uS5nuWHxq1/GkyRc0/BM3tnDM=
X-Gm-Gg: AYBFou0Gum0e04wIk/9BzG0qq5WgC+vNmPPnsnQW4oiUmp8xMBORGAmEiMzFK2HbeDM
	Geeoctj6Y7dtmI6QOL2OsXAHYwdjSMeqVqpVbhNjEBpol/4FLzV0Tqdi04TnTqnhn42GBUlpP2D
	N0tSe/vDrss54MrhRtNS7+uTI9ReN+wUuX3dtX50b409TSstKIWV1nY2gbJXJ7CSOJhbKq9ll1B
	CBO9pjRh6LlVLCKMr3IJQAAroCBUaaHzdRRJKOWGOkuWwfv5OFpMv6W1cdbrLlbSoSTFyFTyFbT
	pxLmBbbjYTMI72cwk7w0HgS5DaBGwfiM3SvvIAg2+scqnRKMSZ07gQM/VaZiUdmmBkv9JTDgVEn
	oyJ7tzM3wgDUwyZzGMUyg4nUwgsZxwKpZZIs7InaeqK9gZM+G8MKykyFV+QXcWOeWsMPtgitPn2
	Ekqu/p0tTHfw//SoXQRotLB3yKkiqmRpgM9/oqCub91SVX4o2Mhxa33/Q+E220fe/n2CC/6QmYB
	Gq00rEfeK3QzNmiGmTwTsggYENjIoFb7f6jkjof38r9d1Z2NBi5B3jWqJj7pmtKb4/CSg==
X-Received: by 2002:a05:6820:1f05:b0:6cd:3fdc:2664 with SMTP id 006d021491bc7-70a7f50452bmr388171eaf.37.1792619450586;
        Wed, 21 Oct 2026 14:50:50 -0700 (PDT)
Received: from shuah-tx13.internal ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84cbd2d2d29sm3413637a34.15.2026.10.21.14.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:50:49 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: hirofumi@mail.parknet.co.jp,
	shuah@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/filesystems: Fix run_fat_tests hang
Date: Wed, 21 Oct 2026 15:50:15 -0600
Message-ID: <20261021215045.26522-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

run_fat_tests script hangs waiting at sudo prompt preventing the
kselftest default test to complete when a non-privileged user
runs the test. This is incorrect test behavior. Fix it to test
for root and skip the test.

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 .../selftests/filesystems/fat/run_fat_tests.sh     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/filesystems/fat/run_fat_tests.sh b/tools/testing/selftests/filesystems/fat/run_fat_tests.sh
index d61264d4795d..0712c8d23fd7 100755
--- a/tools/testing/selftests/filesystems/fat/run_fat_tests.sh
+++ b/tools/testing/selftests/filesystems/fat/run_fat_tests.sh
@@ -15,6 +15,8 @@ BASE_DIR="$(dirname $0)"
 TMP_DIR="$(mktemp -d /tmp/fat_tests_tmp.XXXXXX)"
 IMG_PATH="${TMP_DIR}/fat.img"
 MNT_PATH="${TMP_DIR}/mnt"
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
 
 cleanup()
 {
@@ -23,6 +25,17 @@ cleanup()
 }
 trap cleanup SIGINT SIGTERM EXIT
 
+check_prereqs()
+{
+        local msg="skip all tests:"
+        local uid=$(id -u)
+
+        if [ $uid -ne 0 ]; then
+                echo $msg must be run as root >&2
+                exit $ksft_skip
+        fi
+}
+
 create_loopback()
 {
     touch "${IMG_PATH}"
@@ -73,6 +86,7 @@ unmount_image()
     sudo umount "${MNT_PATH}" &> /dev/null
 }
 
+check_prereqs
 create_loopback
 mount_image
 rename_exchange_test
-- 
2.48.1

