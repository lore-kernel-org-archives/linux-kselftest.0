Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEB31AF09
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771864659; cv=none; b=XSniYbNeB8fzWHBRkNDwXTiHGe8FfzE2K5uAGlUhBMeIBvVpuSF7+xVd2zqzhO8OWxDZDV5k2Z532N4MsRcReNA1saDQvCbrh/LbbdmH44pHwBsneytnaXIRoAiqTsCtrejdMOSugsNUOtk+fjROi+8Dpr0czIJayO0DN/N3lGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771864659; c=relaxed/simple;
	bh=pOvqQ22sJSYPUeX0jI6hwPpaMIwAs84Nv/JAu3rmJlA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dvzd4VhDvuivsCeFuIJIcbAKwwG2KS7clhPKT6YiesXtF4oUEbbX+tu67IpwSGgTJLkknpPqjztq1G4eeXOh/71v3f+nlJAC88UC8HriO3h0MzkmPnH1m5ox+nZhYlZDLxR/E6kmHzXjhqPfzCPPi0fLw5qqiBnd/CkfM/gVn2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYEM/4Ds; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYEM/4Ds"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48379a42f76so35335395e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Feb 2026 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771864655; x=1772469455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWEvoxhzZBj6+mSn7egBTjz7dht5us/wSG/zeGRKBew=;
        b=OYEM/4DsFff8xMNVhiJ86YpLYCE8WpO5dnsOpqHgnyNvp2nh+qBHpUjvXR3aVrI2PI
         IzVKnEH+pFPn6h5ixeh93nH8E07AsAYJXoz4tq5BvU4I+qPqvMrTQ4rvao8nkHKixKVq
         GgEmyl4zjov9nEKgwPJC5LT0o3nYlx8tU+dKe1LEUC6eD+kOiQ7wHK273WI4sEftf85B
         jJQIeEFiKd6xOIR8kj6gNS92HifNY5z2oz2uyknMGXangJRCooUFCxe1BaT+zVDZLO0G
         Wz7TxZTRv593YGT+Akf1WYvZx5i0f0ifm58NeE19rDMCq+gz54Y61fPyJeWdl6EyF5NI
         vKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771864655; x=1772469455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cWEvoxhzZBj6+mSn7egBTjz7dht5us/wSG/zeGRKBew=;
        b=R7c46muJ1WzDkFJjbnw6ybwN6ZIPprF7Rnhw55C/oeffDpVrFKjJoNIpQg3jQJHo32
         YHB1/3d9wGbhLHOFltWJjlmzdL9ryjJw9UC94dYAydYSDzuEyRKDP+7hGhXxFlJPEOFr
         qtOp3bLOP69cqxcOxsADNvMbnxp5av1/L3NxvQnCp6PoQN1IzNBr6sEwXNex7v4XqjmG
         s4D0Ls8rTTHmU3lCyfSUTKcEIc59nxaLWCsiWUH3nIcd9pZcwKFqoqJDz8+jmNQPJt30
         MhwNUKL7m2mXDmhQW7hJf3A40oshT108tksl6gX+cPVai47dmhUxgAQCxHB7wXnuW1RD
         4xug==
X-Forwarded-Encrypted: i=1; AJvYcCWc4gXsKP0DqoGZPqInlOicBhIhiylf/4+wEFipm+0Wo+6yhsbdCRhwv2lM+MbKwbXQR6Wp5OqfXM6sKXysTv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwighALCKYub7t6bGbO5pG6gcS2Ti5Z2y2dKAIRPe1GKOswGL9P
	TjU8UFn4wULRb6IkbLd/+/+LDJhUU9Z3n631BSxBRWP19LNPjx9sHEEy
X-Gm-Gg: AZuq6aIi+gDhkXvReX4xp7kR57DPCZB/NzRVp0sw14DXOLhyrPGun8Fg5euhZa3sA8j
	JOBhdkLP3SIxC9Yk8i+izxV32AjR6AooM3RxC6Cy75VLcAiMQHDoKMxhkxstQgIOI+i+kufP6j3
	KfEwmW4lcefmeEl2GdpEuLtZ8lfNzVrgvHqinM62PSOpYrcfi9+mM02KWfblqOSqzorP/vmcxZR
	YF7mqmHYl9WaHDkDrtnnPdxrPNBtttfklPbyalk3z7K0ebaGeT8PayN5ZKkLXz51cC5wAPb4i+C
	iM7VOiTM6dPjJJsE+euVmo2q20di00FAdvk55M94mZ+dR/1kBrJKd8lYyOwIIG1jArpROoCS/A5
	nlqkAXfhlz7FKB0bbt2dtHZL1KTGj9MKM67N8E460hHs+Hv2uEv1RcbNS7nm775fra6D+K9PB0/
	kowskb5LZUlSL0rcKEB4odBPzVYQuSelRrkG8FxFcyF/xnPjNaQWi5dZ8OrnpjikgQ
X-Received: by 2002:a05:600c:1e0f:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-483afea0266mr76340835e9.19.1771864655120;
        Mon, 23 Feb 2026 08:37:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3dd7sm285500355e9.2.2026.02.23.08.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:37:34 -0800 (PST)
Date: Mon, 23 Feb 2026 16:37:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe
 Lawrence <joe.lawrence@redhat.com>, Shuah Khan <shuah@kernel.org>,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] selftests: livepatch: functions.sh: Workaround
 heredoc on older bash
Message-ID: <20260223163733.00e23e47@pumpkin>
In-Reply-To: <20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
References: <20260220-lp-test-trace-v1-0-4b6703cd01a6@suse.com>
	<20260220-lp-test-trace-v1-2-4b6703cd01a6@suse.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 20 Feb 2026 11:12:34 -0300
Marcos Paulo de Souza <mpdesouza@suse.com> wrote:

> When running current selftests on older distributions like SLE12-SP5 that
> contains an older bash trips over heredoc. Convert it to plain echo
> calls, which ends up with the same result.
> 
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  tools/testing/selftests/livepatch/functions.sh | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> index 8ec0cb64ad94..45ed04c6296e 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -96,10 +96,8 @@ function pop_config() {
>  }
>  
>  function set_dynamic_debug() {
> -        cat <<-EOF > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
> -		file kernel/livepatch/* +p
> -		func klp_try_switch_task -p
> -		EOF
> +	echo "file kernel/livepatch/* +p" > "$SYSFS_DEBUG_DIR/dynamic_debug/control"
> +	echo "func klp_try_switch_task -p" > "$SYSFS_DEBUG_DIR/dynamic_debug/control"

Use printf so you can write both lines in one command.

	David

>  }
>  
>  function set_ftrace_enabled() {
> 

