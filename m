Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169467;
	b=IZSMRJBwLIhlB0hL4yH9rvFYT0vTkfn8KrgibN2Ll77vFSmyml0+eK97Rl7VK8qto5PD
	 Qz6CEQcyZkqZyNTrrKcMgV+aP7HzDwz2Hp3cq5L/+x1ETuQ0pq/ZTcRRIWN9iWu4yShFF
	 3xOyR6Dwt0gqcZflaCcc6a/5Whvf8pGg0Mfhbf+O30CJTe1jv+W0OYjvPLlD7dmZppLVc
	 qqKXgPaRC/zvTSwX+wqprPUwVevP70OFGeQMwUNVPT/D3jLWN+yJb3yw9CgD7NgpHrLLO
	 yxqm8DoVGJy8XC3YJVStW8ga82tKgRdPfU4L++lqx4jIPnYzHyPGumwvt1eYHkH+lLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=q0L5KoeSSJ9JnTFnKpazoYgvFNGkegOX+bYFdABwfpw=;
	b=ag8TeAdv2VQG1ZkstmDcxOHAkCvMp6oQ4Fe1RnvV38aSJR1ILD3TMo06GQsRefmOA78Y
	 jRwMjljKjfhv8zonQ4bK6yQjcqbhF1eUHmfKCmGgbJ3MUFiNy7IukSNJXD7WFMUpIoc3j
	 aEgSMWfviEDGPU8TtZQALNMDzt//K5VtNeYCtNfKpe1fg1SnXGp3e4WHj5jUNla6bDkjQ
	 aKil0sZsd6kubQ3M39JbqWPlXsHVz562+kRDwrxe0ZTh5u0VnGh2XKX5BTR3dyLS3gGyV
	 GuFty6WVQUEU31NZU1v2yisHmT2M1hpAM5UEXEV6nlg7DBqLJnc8mlJiYney9XOE7Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcHNMHbe;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AC2607A77D
	for <linux-kselftest@vger.kernel.org>; Sun,  8 Nov 2026 20:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37AC2607A77D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OcHNMHbe
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so2309515e9.3
        for <linux-kselftest@vger.kernel.org>; Sun, 08 Nov 2026 12:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169465; x=1794774265; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q0L5KoeSSJ9JnTFnKpazoYgvFNGkegOX+bYFdABwfpw=;
        b=OcHNMHbe6+Tr5tBKj3Gx21HnsTCetKKcEAwi0Rw2V8sch6vR/a4C4Q8Q612oZhdRqJ
         N2b0PjiuTqdulkbxYXlm+LU/nj1FHo+cE6x1xsGSPg7diqZpRa2ZfPr6YpcOnNJRhW9r
         fiCZKxy0bzcDpqhU+9fsgtTevyNyR/YxIw1snxETcUqb6NHsydLgd9kaf2w0dmrOayS1
         Y2ev+T2O8QZh2vpgnAtekOkOhmSQMcEhZExKkupYfRTlVo4U1yI6wXJOR0uthiUY9MZ4
         2HVhWDhKoQs0eUfz2cT87I+XMeEAFqleexf/f1VZMnjnX/oLxZcIS5BLlw/0YkR830I6
         At9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169465; x=1794774265;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0L5KoeSSJ9JnTFnKpazoYgvFNGkegOX+bYFdABwfpw=;
        b=JsOf+OPi7oniQpYK+atGAIcGnx3dHCYSdHGddxlmgwzHJB9UyMMGZaZSEBdqtQmZxR
         Nn4W4c+EiNwYhFUvlmZqHImzxktHj68my5cDSw6aPoBWkgM6mK5QcgPyExyWhpOHoy/c
         HigHxdL3AR3c1Nlp9SrredrT/0QxgqJd5Uk8RwYhhCvd21GBba+mZ4FX3Mf6tiXszJNx
         DPcKt2v7CEOS0FloNXBe3v8G1MP8RC4az6fwfxACPtuS3xIsf4GvCsb7zZRBQC0nJmCm
         FdCdK9tgDlQ4pWObNeonP5AWTvZ3G03BUo7vGDYTpKXIVGVSi7Q2pwsCBeThXxjru7RE
         72fw==
X-Forwarded-Encrypted: i=1; AL+hErHTTzhkUWyEccU2rNkwzeXS8yASMUPTwTWVfFx93/W5yNEw3dhvAsJ9yaw7E/hiqwy5s4MS3bz1QmGwYPPXBlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9dp6ugnFvOTq4MLTL/Jss1l/SwiOqo5il7r3lgg8oZ0OrO7Dd
	eOxPm09/PJIWuc+cNEEY+v9X5iPD61e/4KYzZfLD1COiu1h35dsadFbj
X-Gm-Gg: AYBFou3edGLxesXTRmOwbetPgkiASFr+W51RHu6HiimaOWBwqV36AnLxAMuAkguT9Ao
	a9uuAjU0KscpZZ0BrTiLvxLaHO7/SYTs1do6NYekEUoOtTA0Nduvk3pqGMTlm2gMgR8qewIgLAo
	3HcIklSF3R9K66vfC072UGmPkNJ52BntTZsN0JnI9UGUNEfzUDgGkK9JljzFK/ne+LdnaVytKTy
	wA8uKyFSqMD4S86cjZhPllSA12cuJeKKq0XKZaYfEV6ipG59PPTquHhde9F9UfaarbU3XVXLAC8
	R7W5om6k3s+bS5eAXemgHeCQ+gwYVGB8BgWxR0td66jha6/xoXdXatk0vGVR/LWL3T/qcV55t1Z
	j9ib8c5ZKRG1JefMi8eshm9rg4b2sVcU5JRi+FlyMTpOYfzA44Lg1ZxEO7Fj6bLZ3kN1chKzZCy
	6mfjiiN0VEhLbRtGuqMSxL4gc5v2+4fKdfubSHJKE8mL4DeygfrYMQC3F/bFqaWRbx8uh77k1xf
	pdXtoMtVa5in+QnugEYmh7eVYBTnJ/OKJw9QPVSUsQvTAXzc7ES6lLq7Mdn0ger4SewcMJsIpYv
	av955iOfMI0n3ajsVnt8U599Y9HndrVsYINj7hknCN42IpFJbxXKjQ==
X-Received: by 2002:a05:600c:811b:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4b94d7632b5mr38260125e9.4.1794169465512;
        Sun, 08 Nov 2026 12:24:25 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90619bc91sm80029115e9.2.2026.11.08.12.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:25 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:49 +0100
Subject: [PATCH v2 2/4] selftests/landlock: Test that layering does not
 break refer
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-2-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Regression test to exercise that layered Landlock domains do not
accidentally deny the LANDLOCK_ACCESS_FS_REFER access right.  This
used to be the case when layering a non-filesystem ruleset with a
filesystem-enforcing ruleset.  In that case, REFER operations that
would have been allowed for the individual rulesets would get denied
when layering the same rulesets.

Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/fs_test.c | 39 ++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tools/testing/selftests/landlock/fs_test.c b/tools/testing/selftests/landlock/fs_test.c
index f725882fa4a7..b92cb988a39f 100644
--- a/tools/testing/selftests/landlock/fs_test.c
+++ b/tools/testing/selftests/landlock/fs_test.c
@@ -2612,6 +2612,45 @@ TEST_F_FORK(layout1, refer_denied_by_default4)
 				layer_dir_s1d1_refer);
 }
 
+/*
+ * Regression test for layered domains: The two enforced Landlock layers both do
+ * not restrict the tested "refer" operations on their own, so they should also
+ * not restrict them when they are layered.
+ */
+static void test_layering_does_not_break_refer(
+	struct __test_metadata *const _metadata,
+	const struct landlock_ruleset_attr *const non_fs_attr)
+{
+	ASSERT_EQ(0, unlink(file1_s1d2));
+
+	enforce_fs(_metadata, LANDLOCK_ACCESS_FS_REFER, layer_dir_s1d1_refer);
+
+	drop_access_rights(_metadata, non_fs_attr);
+
+	EXPECT_EQ(0, test_rename(file1_s1d1, file1_s1d2));
+	EXPECT_EQ(0, test_rename(file1_s1d2, file1_s1d1));
+	EXPECT_EQ(0, test_exchange(file2_s1d1, file2_s1d2));
+	EXPECT_EQ(0, test_exchange(file2_s1d2, file2_s1d1));
+}
+
+TEST_F_FORK(layout1, layering_with_net_does_not_break_refer)
+{
+	const struct landlock_ruleset_attr attr = {
+		.handled_access_net = LANDLOCK_ACCESS_NET_BIND_TCP,
+	};
+
+	test_layering_does_not_break_refer(_metadata, &attr);
+}
+
+TEST_F_FORK(layout1, layering_with_scoped_does_not_break_refer)
+{
+	const struct landlock_ruleset_attr attr = {
+		.scoped = LANDLOCK_SCOPE_SIGNAL,
+	};
+
+	test_layering_does_not_break_refer(_metadata, &attr);
+}
+
 /*
  * Tests walking through a denied root mount.
  */

-- 
2.56.0

