Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DF9286AC
	for <linux-kselftest@vger.kernel.org>; Sun,  6 Sep 2026 04:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788668515; cv=none; b=CEGzgybYYBgHNU89HtW0a1su5e9Zp4lnBhbbuDfM1hH/C19Zb4t75KdgPLOFi2TeiRUwziuBZLIpH94s6tP/6xGYXfj/aeyWQaDl6KkHIoh93enmpXrNkSgcQ2s+qVy0JsnYDPFQIn5MXWgQ/7CQe29z4EVN68dlnyY/s2oqf+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788668515; c=relaxed/simple;
	bh=vdK3wtpjZYQNeaslASnAOYg/PCjcSi/RbT91Z1Uest0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UN1bBHBXvFpoblNlNMdkg3darqLufgoW3K4MECZmRJwCQbRzM8l8rEgWypfxLkNp8HwO37NMG2XNc/SzXuZdIIficMnRFB21YH7sEO7AdfqYpD/Hxv6P5cspeuCIkb0s57Wg7aM2IRbXP48pYID1eL0emexN1CJ2z3PVXSnBXho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JO+e6Hc6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JO+e6Hc6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3115087a91.2
        for <linux-kselftest@vger.kernel.org>; Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788668513; x=1789273313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VVHZoxQnI4RGBc2Se+Rzzto/jsA46jGgtEifAbeG3A8=;
        b=JO+e6Hc6KGrWCldK6My/o+Bquds45AKpAqktRB6N61AflFaGAoLtY8IOjZwRj+Rz23
         mDSEf7BjNvelbembqo72Y/e+uZk2mK6MD9stlrPEtU45OoNmsEaAY1foYEKdYMA9fhRs
         0p19GdDHixuycMJto/tLitHjHwGvVRG/0pAjVkTvsvELP7NFXh6+cuSKiGYUeumEH6tr
         Un6qVsnyJmXy+vroLP/osFxDt/JUhQ90XhzJ1gcPn3uNIXgr1D9RpqNjxnu2kdgyNr5e
         xQpxxAnUS39woI1skNacI7f7e0+TOfmbsS0Xj3boMc4Vq4Pr4/gLfYmqP6NcAT5Q2ri1
         GtkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788668513; x=1789273313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVHZoxQnI4RGBc2Se+Rzzto/jsA46jGgtEifAbeG3A8=;
        b=XPalUW0nLCYDAwk9johqACRu6OP/HtxKcfz2Px++RT4nfQhKBPJh34Q38lrrMRieL/
         ulOkbhTwYjmbzfWONS9kgCqhAoIrZ1+xcbrvhNDe0JsBI0oXa8mWa7z4x3lGXbUYIo8e
         AVGBMhG/B0Cl5TbQH2qcYvkDIt1aUmrOKbAQe5wjfe1Ck2vmZW+IvVwjMTd2Kk8HADEW
         TDPDa7KZ8n/VnLokcE7p/hjmkBtrPoyCxeIz8GkMa2ZHAr75Vohp1FRTYFaSQf9vtyp1
         m3VrucnE8Fk8yjZzJFRXDvwLhbsQTyXVcmdGT5Y2J7MLTumtmMac1SFz6bvV4jDOMs/W
         xtPw==
X-Forwarded-Encrypted: i=1; AKwUvBwRXWRT1a3/SzEpzjdL6Evuoe4UcncS0iaP2Tj6oNXsqJaQbJfBQOcHyt3yqsMHk+7oE9UgHmvBKXXalNHYOiY=@vger.kernel.org
X-Gm-Message-State: AFuF++mVggCjN5/+w7hIZBmQ3oVExFw394vmYpQVZGshPxS9puin6roa
	rpwUokg1djFsvmUZKN7Ca6dZ6G+mog/Km96MIjre4DFyC6KuEU3/WmDC
X-Gm-Gg: AYBFou16idp2iAWW+F38RNNKvmUbTeJA1QVzF7GJ7tB5C2Yvs8i9iJwfdzLekf1v9cp
	uWDi00Irg4nN1adaTLngIh4+NsEfrUrIxwQZUI/rcPYop2ADZCs+C0CKS1aSZ7SRPGA7o5UVuUG
	akA+JykTo4LP9RZBa1Zr9VXui8tjVePDoRKSWxeV4/jiS6hkCmz5zdFJykn4AH74JiZrf2cbBCW
	i4mCx9FdDTwb1Bup3BrAcvpE2WON8/EoXAr9CWsdsCnfs/RiNVvCtlCVQVsIlPeHhAeHJ/dIskc
	3r5AmNwVKfbOBaYTXzB1WZgvwitHlNbHvWYDn5Uyzu76n446Jrf8bXzKvWlsT1PiJXxwft026Tu
	PjnhZAfEtnbVukYeYLJpVhA2KFbOHi7MubI5MTaKFTeuLNdp+oE5nQxXEfzsDe4ZZM6ASYEXyf4
	DC7J8uE06v0lbGfihCPDyNS6VC4qh+BWh5u+WjCh3UgEJhYzIx1clOuEl5cnZ274IFw1m07iqgh
	nqoebVuc/x8C0va67GuTTdZBeyN/BcCQKpM79DqOHiOtor1vDwYrUo=
X-Received: by 2002:a17:90b:1e51:b0:399:ecd:d68d with SMTP id 98e67ed59e1d1-39b26260f7dmr22268351a91.22.1788668513437;
        Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
Received: from debian-rockchip-rock5b-rk3588.. ([27.130.10.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm9412489c88.8.2026.09.05.21.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 21:21:53 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>,
	Haibo Xu <haibo1.xu@intel.com>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>,
	Gokul K <gokul02k@gmail.com>
Subject: [PATCH] KVM: selftests: Fix reg_list and VM leak in get_reg_list test
Date: Sun,  6 Sep 2026 04:21:31 +0000
Message-ID: <20260906042131.630-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calling the test with --list or --list-filtered causes an early return
in run_test() which skips freeing the reg_list and vm.

Use a goto so that the early return joins the common exit path.

Reported-by: Gokul K <gokul02k@gmail.com>
Link: https://lore.kernel.org/all/20260808081050.408657-1-gokul02k@gmail.com/
Fixes: 17da79e009c3 ("KVM: arm64: selftests: Split get-reg-list test code")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
Tested on a Rock 5B (RK3588). Running the test with --list and
--list-filtered now exercises the goto path added by this fix and exits
cleanly.
---
 tools/testing/selftests/kvm/get-reg-list.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/get-reg-list.c b/tools/testing/selftests/kvm/get-reg-list.c
index 216f10644c1a..6eb91d5c739e 100644
--- a/tools/testing/selftests/kvm/get-reg-list.c
+++ b/tools/testing/selftests/kvm/get-reg-list.c
@@ -189,7 +189,7 @@ static void run_test(struct vcpu_reg_list *c)
 				print_reg(config_name(c), id);
 		}
 		putchar('\n');
-		return;
+		goto free_reg_list;
 	}
 
 	for_each_sublist(c, s)
@@ -306,6 +306,8 @@ static void run_test(struct vcpu_reg_list *c)
 	pr_info("%s: PASS\n", config_name(c));
 	blessed_n = 0;
 	free(blessed_reg);
+
+free_reg_list:
 	free(reg_list);
 	kvm_vm_free(vm);
 }
-- 
2.47.3

