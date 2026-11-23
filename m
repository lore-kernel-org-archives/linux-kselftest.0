Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443050;
	b=uodd9qDBZIjg6QoKxZjRKYjXsNkUwT8XRIiCUSbkhYN061uDW/f1pQNmz/lL/2mOn9KV
	 ScCZ0TFV5khURxaR/Td4aBOlriK95m1sg/7VWc8dJRehsRywVJVtLGgR3KcR9L0jlqqTu
	 ZgovBtLZdpWJouxt314n4jHxKA+mlzKWzOp865Pb2Yvby30xGS61R34cKntfkHxXSpNrQ
	 EX7cmXhLuTL65dsmSqRiXCxa/URc1mzx85K63mQ08Rf0fgIYDVZxppaDiLxnsCaEdDu/6
	 I3dJvwGtSZ3stBOq8exTHCKcEakD6VABN2hiyMFIFwKR+8biQHtPw0tTCgvH58J5N1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2CrQ8byNBxWbycTnDL6KtWcb6fchKu5DyLo4nJng2g8=;
	b=dXdMDYilsc+4+KRqyFY4St3F/c5qFC8GtuqSplSavoJwulbkEsUD2Qo4z8qg8mnQNppY
	 CPNWGHWgTGqhp47NhPpNqVEsiQ5Rsg24AnypfdVY5r4+kx/Q/JE5Yf3J2yR68Z7c6PrgH
	 EFLFeBpW45HvAZ3xVcj2YEi7wzfY8OXr+oILWkSAe5qK69uAfgcS2vVswkyadZkDMiS1y
	 fYfoIGAixRELSdf/60s8Afps1whhlSRB/TqHYK28kELGYVDXAkrhegenbAh1ARg1SEbNX
	 CqzfwPIHuY0iLvupxmJQppbkuhqG+mrq+1tD+yjMsXtTQR9Ljc8UBhF3XPAXS3h4FoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QO9MixTI;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7E0606A31F
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 14:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7E0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QO9MixTI
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2994512f8f.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 06:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795443049; x=1796047849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2CrQ8byNBxWbycTnDL6KtWcb6fchKu5DyLo4nJng2g8=;
        b=QO9MixTI3SP6WzE673jroWTo4bM4VJt8wUzo6e26AhlaT1vPZku4GxlHYdZkB++1gL
         6oDwK0YsLcoirbLz7+R/HCxBIoWRYpkSTs1ly9d0bUqWGuA/B2RjKRD/plP378Q2yBID
         HgVgBVcwprrmqfdg9S9BK9pe1GOlQHNzDsrEXaINo05GNOxqnpyBuWbO/D+BOguSdtck
         51mqjOQaJ99KVbwqD3cLe4GSow9FCrIQvndomR5pb3XB7G1NhkSUPWhFHCKsMXhyR06t
         X+dHBs69Du8+rc0SQFdHBTb+O4PnXaWtVWycxi2/IVtqCeZotAjOc+BGgpVj1nglB3nY
         Zjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443049; x=1796047849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2CrQ8byNBxWbycTnDL6KtWcb6fchKu5DyLo4nJng2g8=;
        b=PwpkiLnPSo8wkeBTwEfbV7Bwonz7/bIVWG8VqczlTSlKSvYprlT0zXwP1NVknGaNfy
         RdZAtzir6PLE11COgETwJXpJviO2vzTMo0+ts+6iT5R5QjXfX+ZDglrOFbwvTWgM07vc
         d88oIvewPFavjNxNhEs9bn9hcYhjKmBDwAyj4hrnkzRYBSLWr9MfeoUTsoOD9L0H0YNU
         Bl7wIvnj3SG+zoKUyhlZcXS1klkL0nMK9Z0rn6Xeh64ySMMmMtHoSnZ6EnjU7Uigc4AV
         3NKarm3gZ1kK7p9M/5Nh5osEaWSiUT4wlqCNyGcSu7Ss6mtUpY3fCouf7AmB/u9zCSy2
         ujgw==
X-Forwarded-Encrypted: i=1; AL+hErFSNPEPNt4a1G2EorOesa9NHQcON7zqyXqXm/NkNFvYts3RLqbkLuwP8lJZcnVgEKc7b1Y8ojzawpTXxKqjuIo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hRNHxwicwdPRTmV9QDO9GkrZ3xBWgSuK/uInS8bop3YOOJzkE
	8F9LcZDWIEicWZbVoIxaBl9BHYtjUPoj5oRKqdZc0s5Wlie4LcEV4kMfi4KhYv91naM=
X-Gm-Gg: AZFdTZdkbb7AoV+LJMSzzHPJwrdNAUIgLW7w/TYHSaT4EsJS6UWTjX0d0g264gPUmVn
	WJo4e+jKubevfwvtsxEp4tvh6zbuKlPZmdwOTDyoVXg4ELgyNuiWuHs/FWn2fcNJsoE5T8d9xaO
	Mmiatm1Jgq7UXObedIIQUWB/ib+R8zL/izgZgFJzCSI61La7soknWzCLkwbgpPobHZ81pzPVzWW
	XY+fDCkWCn4uRvuXhip498rOcDHno53rGuIgbHbPxnUjOsekBYYQB4KovOdF5GNo4h0DFSNy6o3
	/yZNbA1gjCYYaGaMKG8w7RKJT8Ix0kUv4FzuL2oxXfxUpgW4N9wb1ntnmV2JBHp8d85nBEOZSy4
	2nQKInM/6NPCwAZfXLbd5K5pYL4fDPghp0R0PsHLU87AxuA1ZitZCJU1B6nkQgzSJ95w4L0W1Go
	zaUNlga+5aYPjGj0/4RPs+N6MNP/CU24an3QXgnoQGfPPjuut3IhgkKZ82upjByg9ZL0+l4mNlS
	ty8sw2vLeSJVTYmSVmM4mCipR/sVTcuNXISda5rWKqJHdnknv5TUTvDpo16ayI7cqYSMzxBMBOR
	7KZTlGtlAIJghlmjLXfbesZ6q/aYaAI=
X-Received: by 2002:a05:6000:230e:b0:4a6:5a2a:f4c4 with SMTP id ffacd0b85a97d-4abb7d45653mr27120870f8f.37.1795443048856;
        Mon, 23 Nov 2026 06:10:48 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm23448524f8f.8.2026.11.23.06.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:10:48 -0800 (PST)
Date: Mon, 23 Nov 2026 15:10:46 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] selftests/livepatch: run the tests with prebuilt
 test modules
Message-ID: <awRJZokKoPXdbyW3@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-5-sashal@kernel.org>
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
In-Reply-To: <20261110161050.2451750-5-sashal@kernel.org>

On Tue 2026-11-10 11:10:50, Sasha Levin wrote:
> The tests are skipped unless the machine running them has a kernel
> build directory, in $KDIR or /lib/modules/$(uname -r)/build. They do
> not need one when the test modules were built with the selftests,
> because the scripts load the modules from test_modules/.
> 
> As a result the tests are skipped on a machine running an installed
> selftests tree without the kernel devel files, for example one
> installed with
> 
>   make O=/tmp/kselftest TARGETS=livepatch kselftest-install
> 
> although the modules are there.
> 
> Run the tests when the test modules are available, so that they can
> run without the kernel devel files. Without the modules, keep skipping
> the tests when there is no kernel build directory to build them with.
> 
> Fixes: 54ee3526796f ("selftests: livepatch: Avoid running the tests if kernel-devel is missing")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Looks good and seems to work:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
