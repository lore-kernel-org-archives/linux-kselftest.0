Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B285C19E992
	for <linux-kselftest@vger.kernel.org>; Tue, 11 Aug 2026 05:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786424446; cv=none; b=S7AnVmacoTbEeKPtVLMmnY4CzZBNw8NDZS2BHH7+jytB42Y8WX6bvq5n8evLxger4EDUnxrWDJ94AvML6OfeTCfA/S2wJlyWcvP/S+ySxUzvhFUFVygz1d4AKT0otQqdg2kObiuYmS3Yl/FnQnOrwpXgWaNgAUw9ME73USJm8wE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786424446; c=relaxed/simple;
	bh=kz5eF8EgHJZV4kT1Yjijkfp28Af36RtKI66Pm5tq4pQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AEjTphv5pLMMRceA3JA350pDqBcwsHr9lI8CSAtJZJJhAEuV+Kt88apYjREIJN5/x47CYx579sFsl+bN7PMDD2iiz6W/88BVjRiz/bUV9AlVzddNfizRFQ7wxezanlsTfwIHXMaxFh0mRyp3K6nPa6BHxc1oWb/HV5kyzuKDUlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZnZooOW; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZnZooOW"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so365596b3a.3
        for <linux-kselftest@vger.kernel.org>; Mon, 10 Aug 2026 22:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786424445; x=1787029245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XV1qyiW1WN9UH6X3Jv/ZBqv2q+Lebe5phUQECTXzBc=;
        b=mZnZooOWLAP2zjPsXkabxZb0ZtxeKPkDSaYHQrdJOi0OSeMqid/ipu9UHv9wk04Awu
         v5noujmBPEERxJtaXtLWXNInDFKjY92gGzMnFXXn1k8G1kOnMoQT3SY0u3XZMTL0lYxj
         05MujVr5V+yd2Frj5u2dK8Xn3aMyP0c2WrAqqq9lHGOVdb5G/mGAdBKxcnxGqKkw5aVT
         johohxxBlJ1wVNMjs0C+R082c3tub5oYwNue+LO3j6DSLDUWjnzo1QLmYzF3agpXgGHc
         Tk2xbhLTyDiQDuK2TOpDsXYqwaDMmF/LGtA6Wv87PG2xrHgIeXjej1AiHrMTPaebPAdc
         x1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786424445; x=1787029245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XV1qyiW1WN9UH6X3Jv/ZBqv2q+Lebe5phUQECTXzBc=;
        b=Msp3aikgjMZpd8c+mb8k02N9KEDg2vOIqPSB9VcQdfgiXeIS97NOtpgDrKRo5f6zuy
         Svn0wzCkaWIdJPnHhc4WyQIjIPjp4xo8EEI9VpBrTuDqJudgMMrUAoE4bjDjBvb4lZS+
         Pws5cQuXc5n3Fam0DmceNvkA76rl4BLeE5/TPKPG7oI3RBUHOsXeUox5G871rb1SEnqP
         jfmibmNAEnUSx3q//qqtkQyJ5W2npe0igo6nDgCMpSxz9EBIhBQIL9+T1qxwlXqQe9xD
         kduEf32dB/Am/jb64RSxGi94e5rMwbu+Nvpd8GJ03hP1CgYTqV5jHFj4pv6aM8Z9jj/x
         mOxg==
X-Forwarded-Encrypted: i=1; AHgh+RoATCTYBNq4z1AXo0PBxyO/VL/eZjTqwLaNt1ypBWQpMeiRIHSBUxzFrbB375JILpf1RFu2pxoClKONPcZeuBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qCvZU+Q0tmjYEeErrfio57RkXdMiTMUz6U1MI5rrKzSmbUm6
	We2eCpuFsQWTzi63vZ3h9P/ZRFRi5GtkzlyGjZx6tq85CFXE+3R+6qDB
X-Gm-Gg: AR+sD12NyEaagkEhzcPgqLib+c3s/LFdYhYtem+a98VoF3Bc92eZCmb+Ca9dCgGBVrr
	DskPVLrgL3B2JDReCG3tqE/dSV2OqcoW7az/1p//mdPX0ubC/bza00V1O9ncpvfKfEefMWA+Cmx
	s9IJs8znykt7jndgQwDb8/UrKOf9xeCSPuUrhKWmFsl3AEloB4i90oH5HGf3pDHwx/rYkVQxf6C
	SgZoqzq5ZiLfGTNgc0NCHqJU+6Q5ZNNUwG9hP1k0SRbj7f45dChlSbaweXXCqElNYzOlWZuqFcy
	6OAF2H/Q/zlKEtHo7lxUvoO8YEX01lQ0srSvH7xC2jy2Wgz1MrHOzFDa0d/+nqhvO528IIOC7dU
	5uQf6lnWQc/9SrBbJsr4YFXMUKdAVjUlOCzL30GTQnJ+kcKiaHc400Nc+9d+hyNXoSZiFPeeLPJ
	KOERRmD9yBGiZr4VuuzJJWitpjhYKLNsP/G8VUteebX274LLk9rNSoC4b8FS9pkYiojD5TKr8vD
	dPLs74=
X-Received: by 2002:a05:6a21:3992:b0:3c3:8d86:9855 with SMTP id adf61e73a8af0-3cc2b793714mr1229672637.7.1786424445069;
        Mon, 10 Aug 2026 22:00:45 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64f0a7aesm585166eec.29.2026.08.10.22.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:00:44 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] KVM: selftests: Free the VM when the SEV smoke test's guest completes
Date: Tue, 11 Aug 2026 10:30:28 +0530
Message-ID: <20260811050029.530698-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811050029.530698-1-gokul02k@gmail.com>
References: <20260811050029.530698-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_sev() returns directly out of the UCALL_DONE case rather than
leaving the loop, so the plain-SEV path skips the kvm_vm_free() at the
end of the function.  The SEV-ES path is unaffected; it breaks out of
the loop and frees the VM correctly.

main() invokes test_sev() once per supported SEV VM type, so a full run
leaks a VM and its file descriptors.  Nothing fails today because the
process exits shortly afterwards, which is presumably why this was not
noticed, but the leak also means the plain-SEV path never exercises VM
teardown.

Use a goto so UCALL_DONE joins the existing exit path.  A plain break
would only leave the switch statement and spin the loop again.

Fixes: be250ff437fa ("KVM: selftests: Add a basic SEV smoke test")
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 tools/testing/selftests/kvm/x86/sev_smoke_test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/sev_smoke_test.c b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
index 6b2cbe2a90b7..646ae93e3c46 100644
--- a/tools/testing/selftests/kvm/x86/sev_smoke_test.c
+++ b/tools/testing/selftests/kvm/x86/sev_smoke_test.c
@@ -178,7 +178,7 @@ static void test_sev(void *guest_code, u32 type, u64 policy)
 		case UCALL_SYNC:
 			continue;
 		case UCALL_DONE:
-			return;
+			goto done;
 		case UCALL_ABORT:
 			REPORT_GUEST_ASSERT(uc);
 		default:
@@ -187,6 +187,7 @@ static void test_sev(void *guest_code, u32 type, u64 policy)
 		}
 	}
 
+done:
 	kvm_vm_free(vm);
 }
 
-- 
2.54.0


