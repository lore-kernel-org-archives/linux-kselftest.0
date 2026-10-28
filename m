Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218537;
	b=ztipsNRiLRP1RNkzATmVljnCWqsHD5jyFA87x4rzZ3IiwNTjOeX8tIwHN6s4fgWRuNmy
	 49JCl5LeO0Uh1yd4FyLxYSq097+8NPeaYsYIltPNxyjcBtMw5g1DXcrmfQSDC95MYJqJw
	 FxZYWSKBLsL5y1ygU2Bf0vleMd+ptMl+a8XwOHxBzjJ+HBhouNmC/8JNbV1iG+l2u1ENt
	 fnZUShFdvVLA5pBGUvrRqWy88XrzRiUMAe9i5Vbc5DrznSJLYYM7b40VoWyZa8lah8OmF
	 U1qf1OQEiIdQjRP9rNyPJY+HSpEudYlhfmdnlEVCbLv9Vu5ElH1Q7cAENrg80qc6Tjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
	b=RM8YnywBUqGXXne3SH/cUU9Rfrhy+6KLff6OeeeKvEG8LmYK78JSyOCsvb6jmZKqah2F
	 GXAnuz6nw6DgRSpsc6VeduakBx9WFPLMO28pqyw7XUuD+XqOxe9Gs2IJjgONyIqBnFojs
	 cTfD9R80nEnd4M2UrDA3XujtA+9V3SZ2YwXNsg3ffiuGAHJfy8sI1L3fn0Mq8MHZysE4K
	 yy1LyV0rm4LgHIgagVu1XXFV+6I9RZcyQA36VAVA0/tT06GP1aD9kEmUoHqvvFKe7su16
	 Um1X+DTXcloWNqh6iEODhetJBJ7bpytuv8xKG4hBNTuGftgiV9bKS0UqeFxrb/xEN9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+FbSzej;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB74606A31C
	for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 20:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CB74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i+FbSzej
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-833e671ee9fso1446160a34.0
        for <linux-kselftest@vger.kernel.org>; Wed, 28 Oct 2026 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218536; x=1793823336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
        b=i+FbSzejfzILMqfAjiNarm21OmwROagALUavAP3oR87wZHMDqX7/T6gRB/m6O/oaNi
         rM7ou+qYUMH1xfzeUlL8iXedsPQmf/WJcE6owe2RU2poYdPH9FxaQOmI78jnYAWsdaP7
         /aTida9TEZd62eZ9y9vtbqcXW3suKIUkSsRkyFu1h/WmwY9ysk9VM88V2qLDax4dH8FP
         eFgq7IS8QKW5paLAFW3Lkmr/+zA6QHlSzIQk1Oc9KECkKK/KMDMHu3IthX383jcb70ja
         FEwnGxJKzfoScR1+335Iqb4aSw/0wp5ykYUmDvwOUNwT9L9GiVp+sH1zvJZSFsY4shKE
         Mfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218536; x=1793823336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
        b=AfF/TWlk3MGS++xFyz//uPm/lsyvPqjOQMEHOR1AsX1aIbBXNI+PP26OXYi/GSUcex
         tKGVllCNj7dvmYDnQ61iy5Bf1KDFDfcGHYN5Dq5EsVSDG65jEe/uhUg3CKeA3N0hLq9p
         GWoxhrRCpLKxqyGSW1kl8w3gOK07jEkrTvvoOVOCam8oILnLZOCs9lU/QHZTMbmykYx3
         Ie98NhdqclbCztD3IlcZxfXtM4dTQ0CNn06cUfOEvL7OeJjMJ7CY8A3W+eBsKHb6q86x
         scoX1GNqbcDt1VDofVyqiy+HvA2tl+f7eJ6Aao7PRo51G3TRErVbm3/COAegRRcSChng
         Y5iA==
X-Forwarded-Encrypted: i=1; AKwUvByQUSNeXJ+T0UDl/7Dbyn6/1bbc+wBrhLRYhsqKC84MfINtFe7FLiEleidD2kL1XBdQzRhBpbQVWh1tvHadFsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYK7NA2jJmPNKL+1sQpbcJddl8CzLfA/4y18UwbxJ3Cn/8pNdxpl
	ktyeNpElKzGDccOKRsW6WD17k47o2Ti+RFHoynUqeV+NLxkSoVbCn0Xn
X-Gm-Gg: AYBFou3oWyXKLYrTugkRjEwiy6C7TY5VYlcDPdYLWqKPXIrf2HIBcjbQ7384JrjMGEY
	nbDbt1seS1im2SVGa7AQ0WNbm7EmIaol7JAO264IMBN0+waQkogSxieckJ1IrCPBEcDf3lkhasK
	64SRRSQ4a7y2aXKYmBa9UOJGxql+/3A4fJizkKp+rjdikpCcbvgBGCoBUzyn4IIs4z7xb+/XlbA
	/ECQd+ErxxgNSzOtmIkwST8FiuzKqMXMiJc5PoKjTa/DEoGqOOM+FVCyPlphlGV3En+oVrLkUoK
	E+NJbwYYzb4DuYA4LSa5Bz9Bb82ut1VbwHaUv2eguQ0SPLWf+pgVbWHA9pRma42ZM7iq6wIUMT+
	m3YFGou1n5LruoHrLsjiuh/7T1MdznlJznRDbCHfvZ+I/nIz1NF1wlySLcX00NiWyGg3YlXo7mr
	+dix67MksI49LycuqrphrvwAolnwDBHPeLXDwvMCs1YWRBaw4UcNYKlH71SDn39KmhNlqiEU3ts
	7OpxME8Z++24wJH5dK4MK04iQER6ALt4JdR1rp4y+hN1IQQTTCJ4o0L6Ez86haeUjSPu4YdsfPq
	MdJ+e/+6YrGXlcfsH5W0N7h2RAYt9tPXK01AyIEFWOwolyBb8/KP+5RFJQ//CYEuYT7CerQ=
X-Received: by 2002:a05:6808:11c9:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-56384299008mr2445215b6e.44.1793218536050;
        Wed, 28 Oct 2026 13:15:36 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2219826b6e.2.2026.10.28.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:15:34 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests: firmware: compare uploaded firmware through a pipe
Date: Wed, 28 Oct 2026 15:15:33 -0500
Message-ID: <20261028201533.158536-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
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

verify_fw() checks the data read back from the upload_read sysfs file
with cmp, sending its output to /dev/null. When the output goes to
/dev/null, GNU cmp only needs the exit status and treats regular files
of different sizes as different without reading them. Sysfs attributes
report a size of 4096, so the check fails although the data matches, and
the test stops at the first upload:

  ./fw_upload.sh: firmware compare for fw1 did not match

Feed the sysfs file to cmp through a pipe, so that its contents are
compared.

Fixes: a37ddddd8603 ("selftests: firmware: Add firmware upload selftests")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Seen with GNU diffutils 3.12. Tested under virtme-ng on mainline
    62c457528529 with CONFIG_TEST_FIRMWARE and CONFIG_FW_UPLOAD: without
    this patch fw_upload.sh fails at the first compare, with it the test
    passes in 3 of 3 runs. A copy of a sysfs file that differs in one byte
    is still reported as different.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/firmware/fw_upload.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/fw_upload.sh b/tools/testing/selftests/firmware/fw_upload.sh
index c7a6f06c9adb..1b234632b611 100755
--- a/tools/testing/selftests/firmware/fw_upload.sh
+++ b/tools/testing/selftests/firmware/fw_upload.sh
@@ -53,7 +53,7 @@ verify_fw() {
 	local file="$2"
 
 	echo -n "$name" > "$DIR"/config_upload_name
-	if ! cmp "$file" "$DIR"/upload_read > /dev/null 2>&1; then
+	if ! cat "$DIR"/upload_read | cmp "$file" - > /dev/null 2>&1; then
 		echo "$0: firmware compare for $name did not match" >&2
 		exit 1
 	fi

base-commit: 62c457528529cdcfa32bc52b331ceca10f3937b6
-- 
2.56.0

