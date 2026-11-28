Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890455;
	b=2JmpIh70qCi1pVY54k5hgaOyFunl7zffXUjaZGlNH4HsX2VDseFpU5U4uxCrqdWPDfVP
	 f81o0ORqf0SFUCkGDY1qJ9URm+b5ZCi7mv4tAJx5Y4lt3/yfQZfmEyNYgixmJhoxpwnX8
	 OvGYzXDhThMM5TGP6QeorkENkEv0lgSAHC/dI5zsjxqSkFiR1B5oetahDML6ZST6qv8rT
	 uIuro0wd0o1yT07MCyZ55/OyMF9hCPBbqXpWsKWE3PfCRX085w0gSUndxeaOvoxql60sn
	 PsPtio9yINyngmFHMuaAUAzlEyHTxtqpQVtM/k2dD0uoZNlXTFGu0xtzpxzgLZNxlWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890455;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=pH+IIUxEHtaoxheYVASImFgJqG0OeXX/M3zAE0ZQvac=;
	b=aT/5zXZKOwOCZuv7pFoCGLG2+qEAk044plhBJ/Azqf/+v7TVzl+s1fosXu1nleJFEjJU
	 Pv9hcARw6dSJdKwZiKWXqlLEeenD84kxkcvQxOT21oi+d6rfjxMbt+KY4KfPws5eaWf2G
	 YetJTVU1sqsJV3e8h9bkxVrV4T57hEvRiu6EBrFRpaZWzrqEN6tQ0HMf4cTCQEDdJ/MW8
	 gj4oYkEEYqv0S7gyOMtB0jJbVW58fvU9dxUzxpASv6wBD9UGzaX8elMTEVadrgHCDzbCJ
	 nx5LPkXfk3xmi3dpyGr9hr7qle2J1kRPoiU60U6QmKUkD8jSbB88lLs469/vIa3zDPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="ozOfjG/o";
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E71606A32E
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3E71606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ozOfjG/o
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67df3b1ca06so10100106d50.2
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890454; x=1796495254; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pH+IIUxEHtaoxheYVASImFgJqG0OeXX/M3zAE0ZQvac=;
        b=ozOfjG/oVHageniF79fHiekzDSL48Xo3vJKpTz5f4C62l0o3ucr9qXiKZnBV9th7z4
         2kye/y+2JfA3/Ab74y0itqD+6sG/eqDn8tcf+d/6/LopIwaVXMkJQ1cw4BV8sT6b3vOu
         UF6zcmwv8q+qL//50+kkJccT5ns9mdReIiSkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890454; x=1796495254;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pH+IIUxEHtaoxheYVASImFgJqG0OeXX/M3zAE0ZQvac=;
        b=qmlcrWyTtbspmW8SdxcbuHvFt8+XEYlSgpyehVTlI3WBnnPNKAMqQo6CrutWFgshsd
         bwvkvtKXO3qVLIE0/fNpJ8e0iQ7IOtFO+X+XE+wdMKj6/VSLck8IRxyBGJE5U+eXEmp2
         jZtB07Rup8KvwvI6AEW+Ac0SsAUmz6OIBbjQkI+MlC0kNqxxD0glPdD71XJ1/4rWQGst
         yHx+ibXxJz1GEObMdM32m61WN7E/AeXesC20GUJ+qjhcvgwJ18d0yMScGm6loP1FOYdf
         r54houtyiU0XNxSLvsqKU3aSnTrSHGfusRjT2KyzCSVPGhFvM47V8eqGZAy9AnZXWlgJ
         qpWw==
X-Forwarded-Encrypted: i=1; AL+hErEIInO2zn0o9/YZj1Wfz8Md1cw5LGN3N/ZXocu6P4z9kbDeWRaP7dAbtdnil+H+UqsXmbU5FChPyiWiYY+ef5k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wKjvdwFjdwRv4x850P7IU3SVjApPVafj60gMZ8bVb94lcKWek
	qIN6OPXgI50JB4cL2NCtfb6stzuSGdD2bEtFkUcuTXu963o6UZmR4zDrh0DSk6HcXoc=
X-Gm-Gg: AZFdTZfyc7WZMhqimvPPxSnJDFtyGh1OXc630l6BtIdVJQfGM+kFPkhLKAgK1nAKmJA
	nSDyClo+te1+DKGRmRm5d2x8oe+AMrlg0MzG0ixPCjXMtxcXPPPKQfY9rpoKXqI5sVIp+0D7Sb4
	5F3ePy0dOtRb08UA6+WwgmpiyJbwcZC5pD6BDq7yMS/9G8epSTfMqxcOw2z87TCTlBF9VkO6awe
	NzOEpqrljRjgcgdhCAowI2qW+6Lm7j4COeuz21kCr2rSQW+xQQjJt+WUGpkooRf560lPkiSKABV
	9v+jljTPaoolzy+/NZ7ZAVrp/BheR9rCvwsjMyxfvzKM+NXw8vbwacNFKKcy6ionglrSmcLxsEl
	6hzPCM6T0inN8V3OU6UrRTwuGUJjvHGbdIqmXYquMxDJCkvn4tOaFRlBFerdCPYSgQ21BAk1cKz
	bnJsmlqWFt30HCFwKSor2/NeLRgfyqLO74aTBKnrsgKwBxOmz8PRWw6Zy2/gHkWPdRLWyraiSjD
	saSnNZMyWCenft/v2iUEKonmR4ncGG7GAu4NtjnFyzu3Swgeha5H5zE3X41Vo6mUEONNDV06Ky8
	ocnTclx5pYZOtrkRONb2X8PVmRG6EhHsZ2KVZTQi0MXoLhEL9ctEtsIwhdiEP9g2QZbH41CWbdi
	CVT2SoaQm5Q3WFk4k0RM58SrsmHqTc7gtiaV3ixW/KaoF/n5dNB3J6pXpVcAfgaEnj2epS/nsoR
	zWdAOioYQdayc6bZvpwKsC6rbIVFBNw2MVUk6HjTcvuCSn2gyUIAphe48T15XiSVE/LIGqih4ht
	FqfADEvZ5ZIlacf0Qjoz4U=
X-Received: by 2002:a05:690e:d4a:b0:677:bf19:f062 with SMTP id 956f58d0204a3-67df4455068mr11255646d50.71.1795890453916;
        Sat, 28 Nov 2026 10:27:33 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df30e4407sm13153091d50.0.2026.11.28.10.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:33 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:32 -0800
Message-ID: <4015fa169046f1ac59bf3d8b0218a2c2e6c7ed22.1795857773.git.chris@chrisdown.name>
In-Reply-To: <cover.1795857773.git.chris@chrisdown.name>
References: <cover.1795857773.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/7] kho: Reclaim the metadata page left reserved after
 kexec
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
    Mike Rapoport <rppt@kernel.org>,
    Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
    Baoquan He <baoquan.he@linux.dev>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    kexec@lists.infradead.org,
    linux-mm@kvack.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    kernel-team@meta.com,
    Breno Leitao <leitao@debian.org>,
    sashiko-bot@kernel.org
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

After a KHO kexec, the new kernel keeps the page holding the previous
kernel's kexec metadata reserved for as long as it runs. It only needs
the page once, since kho_in_kexec_metadata() copies the previous release
and the kexec count out of it at boot, and nothing reads it again.

Free it with kho_restore_free() once copying is complete.

Tested-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/liveupdate/kexec_handover.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 38e65d210cb9..233c126f6352 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1814,6 +1814,8 @@ static void __init kho_in_kexec_metadata(void)
 
 	pr_info("exec from: %s (count %u)\n",
 		kho_in.previous_release, kho_in.kexec_count);
+
+	kho_restore_free(metadata);
 }
 
 /*
-- 
2.56.1

