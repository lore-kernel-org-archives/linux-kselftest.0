Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44FE49A3D7
	for <linux-kselftest@vger.kernel.org>; Thu,  1 Oct 2026 21:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790890445; cv=none; b=lx2AdGhA1bUHSiO4447pXEJ0yTJQRuLvqNZ7Yb3710cb+8N/SAtt066k5rw6b9+w00mavhQfDQ7BMN8Kwc3eFNa1uShFJjdO5CU+Jhk7V2fOglI8rbg4mwp5zZ5JhN7/oz4Ad8QeogoUOUP2Fr10JTVgFlQHsmKncP4Sj3gpigg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790890445; c=relaxed/simple;
	bh=aIbawXPVSEHJ0DscG76tmh9vZXpkAHRdIDz4TIVMzco=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OOJmrYe9YD4HKMap/Rx7ee4OGnEpRlmj6oXKKtV/fDwTwtinOcnfNQoh6y0hAlARGGJuXkZ+NK5Yy43rFvPTy+jKuk4oPndIszFQ4fsh5Kp9tlajnyZtDzHqxV6d77Z4K9o0C74YyL58sY0a9Nn+b264e1DT9T6pJ0iaFV40QDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=boKQkQy/; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--coltonlewis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="boKQkQy/"
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b37620eb73so12524426b6e.1
        for <linux-kselftest@vger.kernel.org>; Thu, 01 Oct 2026 14:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790890440; x=1791495240; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIbawXPVSEHJ0DscG76tmh9vZXpkAHRdIDz4TIVMzco=;
        b=boKQkQy/fz28Xxju7V9yf/r1v3muO9vuW8iub1LH0Bqun/fKl1N3uTn+dYgOksswlM
         +wgI56EJ9zDa62YaMPd7H3+1WHTt/S2ayjNIEfWf5o08aRrMZMPvRXL3awQxupifx+yp
         2/73Bla8Yej6UHnMOakEVOaTkz5EJCwerZdkIGduFdcYyiv4naUWABD3dvW3LpQkygaB
         kiGb6d+VN+Lrlmh5neRjwWT61McYKzAjyOT4JYMyXFMh6gRZ2VbK7pv8AHfeZbhYHrln
         34ginvXjIkstxJaaG+TRFEZINScgv7KZA3ssois+zz9yrUzB9FGShoh1arvpRwKTfmSm
         /uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790890440; x=1791495240;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIbawXPVSEHJ0DscG76tmh9vZXpkAHRdIDz4TIVMzco=;
        b=vg7QFe2p9tA5rgDbwgkZp2oStEWFjrxf4MGOfQLrDV9Lnm8u68OgLA1FKGohEgDJ5o
         jQyjTN8b/ggvRfM72vM7Rb2OsCFfQFlZTpAjNzBXpJwhYXk5DlwZM6wEzJQyWsJ5Qpoy
         rzg/g33Vinkm6FJqEcYinds0DB8ZaP/n05Xst8uYLnoOlZsMzdlfx8xJohb+/dOOERMh
         6qQgvZVaa7//nsoMmwfQyZfs+DV5seyoOwg1B6lSEbBDGg/LZl6Wt8iRvy2fa+Abtxve
         sKLMHrbXLFUPbT8H+JZE3TBJ9aXK7SPjfg9kRz9SlNB7z36gNI5GME6QfZ22kXBaCdYH
         AYmQ==
X-Forwarded-Encrypted: i=1; AKwUvByOUS7/GNkmA9CY8kCtQP+cSkf3QhNour2k3LWXIcXyRYSHKE3Nt7iWy7DaoHrZFqvlWyozrSj/AOa9tzsqM/4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXlw0n7BWjkn14P5BeCkLBnGKnK2JvhNpRxagJKrvud9JXeHAX
	rgfD1MLDSXzzQTvIpKRw+7fv+HUwGpBZddkRcs8SLSF1CyqWQvpiUdODplkX28+VeCFV91D9AsK
	YjLpyiDyRpNUmDFu0IvT2jrbFKg==
X-Received: from ilbby7.prod.google.com ([2002:a05:6e02:2607:b0:50f:46b5:b429])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2219:b0:4e6:6079:c33d with SMTP id 5614622812f47-4f5292ffc0amr467127b6e.10.1790890439463;
 Thu, 01 Oct 2026 14:33:59 -0700 (PDT)
Date: Thu,  1 Oct 2026 21:33:57 +0000
In-Reply-To: <f54b9ea6-48b1-4f6c-92cc-b0a9249c2fb0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
 <20260924172928.2110956-17-coltonlewis@google.com> <f54b9ea6-48b1-4f6c-92cc-b0a9249c2fb0@linaro.org>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001213357.2088894-3-coltonlewis@google.com>
Subject: Re: [PATCH v9 16/22] KVM: arm64: Apply dynamic guest counter reservations
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

On Wed, Sep 30, 2026 at 04:28:37PM +0100, James Clark wrote:
> If you enable pseudo-NMIs, watchdog_hardlockup_enable() installs the
> watchdog using a pinned PMU event. If host userspace also has a pinned event
> on the mandatory 1 PMU counter assigned to the host, then a guest could
> potentially squeeze out the watchdog.
>
> I'm wondering if we need to prioritise kernel owned events? Or we just treat
> them the same as any other event, and with PMU partitioning assume they
> can't be guaranteed to be running? I feel like you would expect a watchdog
> to be a bit more than best effort though, especially if there was always a
> guaranteed counter available to put it on.
>
> I didn't follow it through completely, but it also looks like if the event
> gets squeezed it would enter an error state and then never be re-enabled,
> even after the guest stops running.
>
> Note, that I think the current ordering means that the watchdog won't
> actually get squeezed out because it's created first. But I don't think we
> can rely on the ordering as a strong guarantee, and it might get broken by
> refactoring in the future.

Good catch. Even without future refactoring, creation order can be
defeated today if /proc/sys/kernel/nmi_watchdog is toggled off and back
on at runtime while a userspace per-CPU pinned event is already open,
giving the re-created watchdog a higher group_index and causing
merge_sched_in() to put it into PERF_EVENT_STATE_ERROR when a
partitioned guest takes PMCCNTR_EL0.

Prioritizing kernel-owned events (!event->owner) ahead of userspace
events in perf_event_groups_cmp() and perf_less_group_idx() guarantees
that a kernel-pinned watchdog always wins the mandatory host counter
over userspace pinned events regardless of creation order. I will look
into adding that for v10.

Thanks,
Colton
