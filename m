Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F441A794
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468215; cv=none; b=d3A7GQTfle8hjdAvtszac2bYjm520RHcXCksqdX7m4lXtvcBmZs6ekLUOFIV5vzgoJNbg3q7ziG+t/TkBYtP/XMBiDT1eGw6+JOG6PuGQwNXwTH3Jr1faa41rAk2GwF2uay45IAYEYtuHTRo3i6YIUtJSCkUyhVd1B/6WWBksdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468215; c=relaxed/simple;
	bh=4HgljSOYxaStgEoNrbUTUOjtp8QGrt8NI8bCteDsYag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TACYRDGCM6UumyFoq4ls2DB0AkmjN2ZaNyTNxh6Puim7G0Ayux42hMHGqzl8kS4kH6XJ6iXhy8LBEKl4sxvf7A40XkRv/d03HxiTJ4YLQ/fPIfvNt6Y4OxW2k9WgzZqi8WoxoWXxSpu2266cdRKYWbPuIwo4CImgaSCtW41FBfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lv2Rbr4y; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lv2Rbr4y"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-351775aa1c0so1328797eec.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468213; x=1792073013; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jtAYB2sgYdS1KrwaZ2LoE0JcHQRSvNhoVr7+8DfDo58=;
        b=lv2Rbr4yop5F4ENaDS5Jj8DbITHOg9AluE6qAsNQMWCMglrSEE3u4wUsYybphZCKEK
         Bl64LgQWXYCw84MHJPvbrQxUhl1WmWtGhqWbAefoxfEx3N78hI/kYnBdE+jxF7vdSc7U
         kvFx7GL/WwLAd4+/23Y3fMMt6wQdqWwqD+qME0qFY/uGA77s4KOtjbfu+FnMmkGlom6r
         T823YtpKbQdJ/z/jzMXmMcxJY1fS/aedJq67bOX1clQrtYFiA3rTp5HF4o6YPjmVxKvx
         vuhHNmGJ2X05axR06PQPPnCeA+eFNAFR0c+gMRGll017EhxQVTJTS7cCnwLRY94kD66x
         Pxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468213; x=1792073013;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jtAYB2sgYdS1KrwaZ2LoE0JcHQRSvNhoVr7+8DfDo58=;
        b=KbET1IYK1n01efr6VnILXfqpkAwkWYGx10rqClqn1nkLV4l3HJQ3Qfu8xSczf41cXi
         Lj0tuMpEPt3nH/sC9cfZwEjoAvf7Ycr/QRckhVO086fgRMxLsuTLZqSsiVhGEKKcVuxB
         Yf5c/FPm0IDqh8HJs+gs4KwuJqpRFznMMV8IcuSPcepc9NZZV4zrmVXNaZmy0qZfFyky
         N4WqFZgPcR+TUBBEbU37IrninAJkTAytd03YbOo5MNFNTksooOvpShOYyueb7OCZLsrc
         X69uhDcY39qwgMl16FRjA3sXiwdGyXBJNRXUEeeCCkJRJZ7XuG7K3cyYDIJ0UL7b2EF9
         gcIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvKh0rAQfuBkNTT9Y7fUA5nZTy2KcmF4zd31HQWXZuD38HgrYsWSyhYCA5r+zMPF/DKFP2mrlSiuS7o2Usa+M=@vger.kernel.org
X-Gm-Message-State: AFuF++lJwLEdZ0IajsehwidK4RJzxwHySMIyJ8+5E3DcRYrpksIFsri0
	zAv+4sbL1XMKeIyf2ETAox4xsPEMnYsh1T0ECxezJmsAqoS1TXVYORUX
X-Gm-Gg: AYBFou1WQiQT20zJfK9k9TaKtJKx+cGYTxB2XykKRIwyN/YewzsHk/5sVe/QjaI8+MX
	f4PrDOfjBgmTcBSClzyLdhOwjO/J9JgJ4L5aiB9NnTnHuN5ZDzvLTvUJ4oYRPJmi9fLF9mLrnQV
	4Sj0MN/J1+ZBz3tOmEvsj2M+5429j589OKxp4T5om8cz5aa8a4uMzFrXDe75MvseDDVOhdRCEnb
	MVViJoG7hrPF59TSADSpplQ1Zn8S71nVRxZtamOIlgZqR2oOvJKs4N8YUZ3Euw/hWPCsxc6ArHD
	a2bSVV+XbHghz+Ir25Fn4lLw60yTYaRZQlB+Nq+jUruj16HjZoqy5hKYtxRjyxURWxovj8CNbOb
	ZBnSYUsGEK7XVNmH3NqdaKvknWxeDphC4DsJvqJeSO+uxUefCYKn1ktJ12wZx+OCEcP7nbj0D1P
	CjQiqgIFq87FUC0HibL6/gl4kj7t3xUs5xXqmAXrNieQr4WFqSagF1VCzCzQPIC3o4pA==
X-Received: by 2002:a05:693c:4150:20b0:328:3cce:4b3b with SMTP id 5a478bee46e88-3515dc5450bmr7188586eec.4.1791468212696;
        Thu, 08 Oct 2026 07:03:32 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515afa61e8sm18772280eec.22.2026.10.08.07.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:03:32 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:03:25 +0800
Subject: [PATCH bpf-next] selftests/bpf: Report a failure to register the
 session key in test_progs
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-test-progs-session-key-v1-1-ec48e793639b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKyix2oC/x2NwQrCMBBEf6Xs2YVNoVr8FfFQ46QuShqyoVRK/
 93E2zyGN7OTISuMrt1OGauaLrGCO3XkX1OcwfqsTL30ZycysuETCqwYP1LgljjlZbZaWJP5jS8
 7L9M4XMTL4KhOpYyg2//mRs2L2Ardj+MHgzx2FIAAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 KP Singh <kpsingh@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

test_progs adds the key that verifies signed programs to the session
keyring before it runs any test, and exits when that fails.

It exits with 255 without printing anything. pam_keyinit revokes the
session keyring on logout, so a test_progs started in the background
from an ssh session that has been closed since leaves nothing but an
empty log behind, with no hint of what went wrong.

Print the error before exiting.

Fixes: b720903e2b14 ("selftests/bpf: Enable signature verification for some lskel tests")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/test_progs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/test_progs.c b/tools/testing/selftests/bpf/test_progs.c
index 46eb201b96a38..168d84cf4eb76 100644
--- a/tools/testing/selftests/bpf/test_progs.c
+++ b/tools/testing/selftests/bpf/test_progs.c
@@ -2065,8 +2065,11 @@ int main(int argc, char **argv)
 	libbpf_set_print(libbpf_print_fn);
 	err = register_session_key((const char *)test_progs_verification_cert,
 				   test_progs_verification_cert_len);
-	if (err < 0)
+	if (err < 0) {
+		fprintf(stderr, "Failed to add libbpf_session_key to the session keyring: %s\n",
+			strerror(errno));
 		return err;
+	}
 
 	traffic_monitor_set_print(traffic_monitor_print_fn);
 

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-test-progs-session-key-1c0a8570c051

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

