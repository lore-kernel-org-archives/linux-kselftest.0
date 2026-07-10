Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1453750DC
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Jul 2026 05:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659996; cv=none; b=mRgqO4Kcj/Y6iQUEOZoWsSb+S+UdDkhwoTCRXPvfh82WaO5994Sfp4ZzrNXUULJs2Yn+tq77asFmcW17vLWmy1vYrkv7cGtQgSBEU3CRc4IXO3mx4X0jvhlAOVjqWF35L51bXdhH3zT25FPeuKZkaTRUUIsyBOoDFIFMr91dom0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659996; c=relaxed/simple;
	bh=tqNjoAgnA9FBPaw/OgwTVGIEq2ZEoyk6fxq9pWfgyts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQZrnNv+1hVxm5QRJPNmegnTwPzUI4ltUShhLpnLHtDBCDNbhDQO/WGOIpaAhlcya535QTKyqSUUj+3tgcxORQhpJgDm3CinJA8D7E6XF6ZAj38eKPefPXp9ktiBn5fUjMJfGd0xeOtAXXd8+E9U6r5aGlpc5SyqflDMij5/7Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oga1ocQg; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oga1ocQg"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3847e8b0f3aso532562a91.3
        for <linux-kselftest@vger.kernel.org>; Thu, 09 Jul 2026 22:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659995; x=1784264795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ImNIiwacby35FVtPkvIxY12uGz7n2N70CkNy2HlFDRQ=;
        b=oga1ocQgkwGiJFx//QKQF4V3Xud+5fOmk1Kj7EK7FYSsSrgHIo8Ax0fvnQNsZCZBS4
         wJPcOv+DADcNg3+BwlzcYch0uYiDHvcKPMsi4eKAJPNEoFVKbBNkMJRBxMobm+qcoBQA
         7N48XWLi/ds5wb6kU2q3dRXAYGqhL70ze1IXMamW2vkc7LhwQavIfUEo13F61OUsPFtO
         +tk53z+eoGCSL70mPAJM62wHMH+ImkdGqr3B0G50A0A3osbKeiecg/+KIjfmHKCQBSiS
         QyZm/WdGmLs/0J32Sce5hVy1lQacDti46o+gVr7PaT0lWh0OQaPTSH6rghlKbV/9MFic
         +P7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659995; x=1784264795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ImNIiwacby35FVtPkvIxY12uGz7n2N70CkNy2HlFDRQ=;
        b=tSGHRoI6UsPaFKNIXbHTv/mnF/mCSmYb4Cf80Fr4ST8XYNb+Xy/p+haCFmZT9YTNJC
         NaNxWesMcZLD0rf8iOdNlm57SHr8WkMjv0MJorDfpcgkvN5Mdpi+IHY9MXovyTJBtWSi
         ddbcNbA3Q4qBIdD45Wf/ewaEhHmY91GxdTUucIkkOEyMnKDBtGzNOZPJbYKoBIHFZNrc
         h5j9xuyu2q/ClGDXHOxIaJ3ahGp8YxaETAOjWq6fhEFiRtu7XqGwj1tJNegs7P7Bz3zg
         A69dkND+fSdf2GsfqG1B3JVGv7JexrPPEnvqdTA5N8FeCGJE+qgAUlqVceENejkhUOah
         iqlw==
X-Forwarded-Encrypted: i=1; AHgh+Rqxs5YJE7qhbd2wP4KHtL+QwktTjJdPO4XYQ2MytWLLnzZlIgSMKwXIOLqFgueYQJWfPy5mWElXoNfkgiXjuiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz1qtbN0dfJUPcm2Bew5i3slzff7djidYlEe3XY+HLocx3n6le
	sjJGRswsYKwoLtFVH6Z5xpQUTPTu7spJ2yFeQjWg7z5HAwfigpt8Wxii
X-Gm-Gg: AfdE7cmM0MrXS9SwxQkEJ52TR6y8DpoFufpitYpJlfivzieL2/CiE50VTHluAdIp38N
	9LGjbMcIyGQlStreeVaQKYbp3JrUnU0h9y327IaHWNOSBcf5/Q7TWahXi0NoSpxxl+jmza1lv8j
	uAUq4hIFuhzj04AhmN2RTOB1C9de8zY/6z+2jOr2dwRIkfsbe+AwO/Viz9udKR/bXeAdrGIJ2ru
	CuwaIBEWihxUGrXQTc/iufyyObNDIerY3m7u8/A4QhwQLi4hLpAuC7O3ELQndlMW1zIFUuPawYA
	egbXYVFvmEwEzXAKjq6GFoiw7RRVAVB2roGo5N3Fk/sHQTUyBHO9MONKQSObaBBk3imGcqUs4D6
	tP17qhF9nEMQZdAbYNZBFiHljkQ0ce/1s7RYl1F9cvxfUEMPBdpyYgxVn+JCJ/wYFZBCzaet/V3
	u6YCwUHCianUki9g/SlcNagAQvXJ6ebs5XGJ0=
X-Received: by 2002:a05:6a20:158e:b0:3bf:ee42:195 with SMTP id adf61e73a8af0-3c0bc90146amr11909587637.11.1783659994980;
        Thu, 09 Jul 2026 22:06:34 -0700 (PDT)
Received: from volcano9f8e-host.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659c865asm38752224c88.11.2026.07.09.22.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: seanjc@google.com
Cc: pbonzini@redhat.com,
	shuah@kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hemanth Selam <hemanth.selam@gmail.com>
Subject: Re: [PATCH v2 1/2] KVM: selftests: SEV: Verify unsupported VM types are rejected at creation
Date: Fri, 10 Jul 2026 10:36:26 +0530
Message-ID: <20260710050626.844624-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260709174955.628913-2-hemanth.selam@gmail.com>
References: <20260709174955.628913-2-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 09, 2026, Sean Christopherson wrote:
> Literally every test relies on the kernel to clean up fds on an early
> exit.  I see no reason for this to behave differently.
>
> Also, Sashiko was wrong.  If KVM_CREATE_VM fails with something other
> than EINVAL, the assert will NOT fire, but fd will be < 0.

Agreed on both; dropped the manual close() and the errno latching.

> test_assert logs the errno, no need to spit it out here as well.

Removed.

> Heh, I agree with the comment: put this in a separate selftest.  This
> doesn't have anything to do with KVM_SEV_INIT2, and in fact doesn't
> even have anyting to do with SEV+ or even x86.  E.g. add a
> kvm_vm_types_test that attempts to create all possible VM types, and
> asserts success/failure based on the output from
> kvm_check_cap(KVM_CAP_VM_TYPES).

Done.  v3 drops the sev_init2_tests changes and adds a standalone,
arch-generic test that walks all type values (including out-of-range
ones) and asserts KVM_CREATE_VM success/failure against
KVM_CAP_VM_TYPES:

  https://lore.kernel.org/all/20260710050442.826777-1-hemanth.selam@gmail.com/

I also dropped the "SEV: Sanity check the launch measurement" patch for
now; v3 is just the VM-types test.

Thanks for the review!

Hemanth
