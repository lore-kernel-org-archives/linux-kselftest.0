Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4484636B076
	for <linux-kselftest@vger.kernel.org>; Wed,  6 May 2026 10:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778063004; cv=none; b=jKxpYIpOdp+gHyb4BUVvZkVD/6Sj+akEzdshgV9wwIriqeUp8g04uFLYUMXEkj/RyTSZiYw7QZ/RVxG1w51CFUN8RgGMy+vvs3aQ2tpgxk7Jm4IOydG0aJdbC322bLYBd1qyyyDnz4jyzS2SOaUIXYaGvWsf2VRw7iIBdVZE2XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778063004; c=relaxed/simple;
	bh=hE1y4kmNtGeYAv67zS4+OoQ1t7uYKSkNfK3zwD7Fhf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlWvHkPgikykn8Eng+UCaKiilgJEW7ogmlZjNcZPXQ2zTseGdmQGbBfs7TtbskIS6MaTGzKAv6gTThRS+d8dyFWneYKunPyyyWpFU8hkXlcgEP58yCJ4s6np+2/sxsTIBvkPG5h909rBSJzGRPmC8GWRoqNvE1NeleaMpctmOtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZPvEcp/6; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZPvEcp/6"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d146705b4so22452905e9.3
        for <linux-kselftest@vger.kernel.org>; Wed, 06 May 2026 03:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778063002; x=1778667802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vyuimllbRFDBrd/zLQpQ1lykL+0Cgk5rh3xGvQeZlAE=;
        b=ZPvEcp/62ZAHSPf2QDKAPjNrHySVflsqlrZZ8OXvPdUriXEvRw6bTaXNH8loYHVPp/
         rf76WZJna/Mug6AoLTDveLq0uqpbUTcoDP4K/1XoA/fG4x9l3Sos9pdRDWF4ZOW0Dx3p
         KHZHAYg/zfvDccOc9vkpiHLS8Hy+bTVSrLk0ZngH//OG20vzq9UxRUfcJGlbnIWzSC9a
         1sJoezSs7XxI1FrLI787Dohn8cgRSIec38RwztDPGObygdtYXi6tKtdDP9nmhQEeTWuK
         DqPnqDRDMXfZ7eHVNI+OleIeYTOIZwdGz/Ff9gA9SZYAvkWtpwoVrcM5cdH51DeR0GKT
         wu7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778063002; x=1778667802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vyuimllbRFDBrd/zLQpQ1lykL+0Cgk5rh3xGvQeZlAE=;
        b=hUGmGv/RCyDywtcrxpIWpluhBpYVt2lfkJ47cg4Cq5a4poNIbkaibPst7KBEzX40iW
         dE6bw3apGJ9kgYkEiJz9Mf/7Rv9PnEzJ0/dLnSpV30hzB4+evFUVDaT5os/iUwa6zYzM
         3RCN0Jh26N0Blhn+IiqNTKrqMG3kEUqqS5Hp1/0ehdfkoNAVp6TEh8d1xXbGpItmnvAY
         1eDjX0REjCBxhnHBiluHBX8yluMGNpjgbgDkrwInftvKxyOpwfbf6quFlGX95OFxBo07
         rL9PCEactv/DNf0VhsPZ0xud+zUPESICA/VeOSF4aFY67ywN2QYMa/LGWUflrWALRV99
         DF1g==
X-Forwarded-Encrypted: i=1; AFNElJ9NfWkjR+1V6oTjZ3IneI+rQNBu+/8XS1K91XGJH/g2bK2+HNQapkL4fsIgKET+MMp8uKCGOaUKOCy6haDcynw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvt5A/7HxGp0VN2XI80xSrXNtscgZJ3isTu4YKyW4EqY6X3aYS
	7xPRbG9/ymznOVAM8NPJvF35T2eBpsjoxG3hM3QrajaAVKN34H05TbL1qAyTmUeNhr0=
X-Gm-Gg: AeBDietpIWdLX9M5OnUg+V/Z05uAOPsfVar3d5uZR0MQZVgiq1bhGRUXjygqZDxYRiE
	Qpc7FJe31mVee1HI747TqKTax8Efxs8Y+wA8CCw1iT/QRdskRWP2hL9AdF4dyd/s9CQp5uMiGbi
	x/oc6QIsnepNB3rS5rTyqG1jAoeyxiWZBKcjRW2oQoFLeLzFkifQ9ExLcEqmL4vf5dHhqFNsXjy
	Ro2KsC24XXZ0LA6hg3yvr+ogI6xughI7TjLOCG7H6Ne3+ffIhNWlIJ0K8Xt1GwupfUHpcF6fhv0
	RIns0eIYCv6j21WKabdEyeoy/lPFVsrFzvC0Nx+NqulqkikccISkoKmwL2dff0ncBt/7LptwaW4
	xTkkvX4t/DyJnXZVtwuLq2GYpLAV5CTfToaZ0YLMUuwhZyDzCFAmHWo2yoqku2//R+mTmlic3NC
	+CB/u3tT3Bm65HFY0B9OAZjbmDliwJdeOXtn7B
X-Received: by 2002:a05:600c:c48f:b0:48a:568f:ae6b with SMTP id 5b1f17b1804b1-48e51f2a790mr50341575e9.7.1778063001669;
        Wed, 06 May 2026 03:23:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538ca8c0sm35025085e9.13.2026.05.06.03.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 03:23:20 -0700 (PDT)
Date: Wed, 6 May 2026 12:23:18 +0200
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	marcos@mpdesouza.com
Subject: Re: [PATCH v5 0/6] kselftests: livepatch: Adapt tests to be executed
 on 4.12 kernels
Message-ID: <afsWlkqDboHezQ5R@pathway.suse.cz>
References: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-lp-tests-old-fixes-v5-0-0be26d94ab9a@suse.com>

On Mon 2026-05-04 15:34:41, Marcos Paulo de Souza wrote:
> This is the fifth version of the patchset, which fixes the last Sashiko
> comment, about overwriting MOD_LIVEPATCH global variable and using a
> local variable to avoid module load clashing when an older kernel
> don't support some sysfs attributes.
> 
> Original cover-letter:
> These patches don't really change how the patches are run, just skip
> some tests on kernels that don't support a feature (like kprobe and
> livepatched living together) or when a livepatch sysfs attribute is
> missing.
> 
> ---
> Marcos Paulo de Souza (6):
>       selftests: livepatch: Check for ARCH_HAS_SYSCALL_WRAPPER config
>       selftests: livepatch: Replace true/false module parameter by y/n
>       selftests: livepatch: Introduce does_sysfs_exist function
>       selftests: livepatch: Check if patched sysfs attribute exists
>       selftests: livepatch: Check if replace sysfs attribute exists
>       selftests: livepatch: Check if stack_order sysfs attribute exists
> 
>  tools/testing/selftests/livepatch/functions.sh     |  10 +
>  tools/testing/selftests/livepatch/test-kprobe.sh   |   8 +-
>  tools/testing/selftests/livepatch/test-sysfs.sh    | 219 +++++++++++----------
>  .../livepatch/test_modules/test_klp_syscall.c      |  27 ++-
>  4 files changed, 153 insertions(+), 111 deletions(-)

For the entire patchset:

Reviewed-by: Petr Mladek <pmladek@suse.com>

It seems to be ready for linux-next.

Best Regards,
Petr
