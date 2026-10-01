Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57574078F1
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 21:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890443; cv=none; b=GxsEEofeortEtrUvlbiqe0xUeTM3/w8iWY5HePx2mpKgxQIWx/wtqwG9irEiMtwt7kjE++NGHDu9tAUkbRK2vG6pheTqIgWYPV8K3CVWHepAmsAzvDPJOVZAxBs/i03hVhv4iSnNvTXr5O5aM3pKWc7uMfiXYAt8/gUQLJrPQZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890443; c=relaxed/simple;
	bh=aoQY2n7UuHsEBO2b/7mwS2MVg8AzdCvjCqCqmkccQyQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hgr1RIwH3kTS4FEj1UnhF9dN3QvuHXpYONDRuTXGdD5wJ77VOm+VkXo7ogk7URr6uhAuivH6AUZu5WU9WHwX6YyNIcLhZF5scLhBUqfOoi5QsUcy3RH+ENQE9hwU8vjIkvDEa5NmkOeEZz4l++YsGptwGcX8jtc0yprOmMJew+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C4QyQjR0; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4QyQjR0"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ec4d68543eso1103524b6e.2
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 14:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890438; x=1791495238; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aoQY2n7UuHsEBO2b/7mwS2MVg8AzdCvjCqCqmkccQyQ=;
        b=C4QyQjR0Rc92htssClGS1cqTRLuedDdvrMqWrl45sKTSkV0N7gcYIp7AfwzGjfauog
         k54ep4YtTv9ARaLkAAG00FZn1KXHTbiWTuzxNVRMxBMMUpfNDEiRRGxFTMIbXnPNqxhz
         AVHFDp81d2Cp7P8PfeTiWIRDTVVgtHYvDN9ATmemT/WycA4RhVbP2jbfpBEOcrQyIf5w
         CCeisilSmC2G/6AteMCTugplztzABCcUEhr6j5C7AIVnYEdU+8h6eoIa/7AtrBVpscLi
         /uRVkexGkHLfgEac9r38Df0IiEvryYM4PYXRyKPSmsEB9E9iS7V/pBUge0OmxR0YdY96
         HOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890438; x=1791495238;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aoQY2n7UuHsEBO2b/7mwS2MVg8AzdCvjCqCqmkccQyQ=;
        b=hzk8z7vhJLoThOWR1BqUxEvm0GdhMpdZUg+WyoYiTvQOM1zmZUJOeYHL8/kMLaM+jI
         B0c/kn219cwvOGcQ7l16jqKroAGWL6cfI0kGd4D88C/LrLS5oCNWXKHiGRrQiu6b5OcL
         6EAuROInKlAb3+xz5F5HUazCcSpAj1AA7Vofq0hiMRekAGcREcObCKELYifrRtpCdvrL
         rfLSFEkD6v3bGASakv1R6wWx/vk1wliJfPQOURhrj9QnyL2BEWi9yHsd8YiYkzjV0G2K
         C472ok/W3Fy+7ZgDfEU0tHvIphLn/5CscZ8c1GaiAefWwwtjreGl/AUenB0ReG3YRQjX
         u9eQ==
X-Forwarded-Encrypted: i=1; AKwUvBy9htf6Vz1qxAR38Oidz7jz0gDIxhrDDKLckow64yNmdYBEzPX5RkLBoNWmMlRUQN79XDcHtzY/7NIxDmUM7Vg=@vger.kernel.org
X-Gm-Message-State: AFuF++kWmOxNMIjD9UbpgJ94bkgQh9u8DbXZsAa5c9oR5ZBK9rNFRYnT
	nLfW5SoOVBqxHv0/Y1vQpE/lymsBeco5ktiJiiviuuT+IhJjAVPpvaQrNtlWYlECo3jABQhf05G
	dZBnIRuM3PgymBYGTCAVOl+WQFg==
X-Received: from ilbcx6.prod.google.com ([2002:a05:6e02:3c06:b0:50d:b50e:1675])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1211:b0:4b9:a829:f015 with SMTP id 5614622812f47-4f529d297bemr430489b6e.33.1790890437780;
 Thu, 01 Oct 2026 14:33:57 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:33:55 +0000
In-Reply-To: <8e47bb89-a894-4fd0-9f96-e11b5dea1972@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com> <8e47bb89-a894-4fd0-9f96-e11b5dea1972@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213357.2088894-1-coltonlewis@google.com>
Subject: Re: [PATCH v9 00/22] ARM64 PMU Partitioning
From: Colton Lewis <coltonlewis@google.com>
To: James Clark <james.clark@linaro.org>
Cc: Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Zide Chen <zide.chen@intel.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi James,

On Wed, Sep 30, 2026 at 04:25:36PM +0100, James Clark wrote:
> Looks good to me, everything seems to be working now:
>
> Tested-by: James Clark <james.clark@linaro.org>

Thank you for testing and for all the reviews!

> There are still a few Sashiko comments though, and one critical one about
> racing with pseudo-NMI PMU interrupts that looked reasonable. I tried to
> test it and reproduce an actual issue but couldn't, so maybe it's bogus.

The "Critical" Sashiko comment on Patch 19/22 (claiming that clearing
hardware PMOVSSET_EL0 loses overflow bits because the guest has direct
untrapped access to PMOVSSET_EL0) is a false positive: Patch 09/22 sets
HDFGRTR_EL2_PMOVS and HDFGWTR_EL2_PMOVS (and without FGT, MDCR_EL2.TPM
is set), so guest accesses to PMOVSSET_EL0 and PMOVSCLR_EL0 always trap
to pmu_reg_read() / pmu_reg_write().

The pseudo-NMI race comments on Patch 11/22 and Patch 19/22 are
theoretically possible in a narrow 2-instruction RMW window because
local_irq_save() does not mask GICv3 pseudo-NMIs, which explains why it
wasn't reproducible in practice. In v10 I will make the PMOVSSET_EL0
shadow updates and vcpu->arch.mdcr_el2 assignment atomic, and address
the other valid Sashiko findings.

Thanks,
Colton
