Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307817;
	b=NyuINSpySKb/+Wq6f+cmDsEA2JmfHhbhUucw1eDoA1Br6Z68OynymlMQNoTLsrm3R39U
	 f5G0BQLJ4LjkcCtMEgAZpj5YgN6T8eeSjyuF/qQYDc6TpSYBQSqI+yqqRiCQ8ygQtYWwG
	 v++V3OFfOmFQcGHiC73gFuhea5Ca5TSY/oiS7dGSQctoUrHk3HUm4+NVuZlPuODhYCIES
	 SPvCX3kSgR8lRhEc9U7BobE4R0eAt8Cn3Dh6Q6pBDZbcZ++YLQdTpSS0X4lmV92aDjMOB
	 kcqQrst8icUXIxAVAhdSeD+tsdL1yZgNv/7Bs27a8ABnk/eeMWcPjw/Tw89djk9M8kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RVTkGzwp8ckIzdQmxfwAcPBKin5d3z25DmdwwACLOEQ=;
	b=iyq7Bb92Y6f2bgCvFKbO48io/F5ITx+DG2UD46zZiZ/Rt7pHeU90pHAtEGaiutj7MNVK
	 wChqYSWwlaFqzAfRjU+ixpjzG1vQbBWYB6Mmx6RKRueqQfM76RErXagB3duVOIaWMgoxd
	 IdxQEnG4p6PVa0Lngyq8SU5QE7im7iggPiasX2efpi18sKfynhCytiocgiM+0DUZHNrDp
	 B9jnEW3vmQCyv4ht8FFyPfBlQT+1ROGQd76eoJW+RNVfJCHe3GnPPTGpny5aNtAs2Gsxv
	 Mz8H0wB2RWFsqQ3VVVBrq9HhjeUAz9AYuVNuHRj+yMjrsXUQgjfLU0K4NTp+YSTD5kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="P/jUBQCJ";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D630460A2604
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 10:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D630460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=P/jUBQCJ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a208d93758so19286565e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Nov 2026 02:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794307815; x=1794912615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RVTkGzwp8ckIzdQmxfwAcPBKin5d3z25DmdwwACLOEQ=;
        b=P/jUBQCJoeTzk8ENZY21IS6gDU+Zdyc3XCOAcCfNMmq10lkR8U6IsmhN6Xm3LtJm8c
         57Lsbw3/yyD/WCd7dwlAtYB4m5l5PDLR8WQN55qbEKB3A1ar0X0i4ayXtpEkZSm/eleM
         6n9AJ1zMuI6fPQNhL7pK4RYhwuyzARnCAXY8ukjpWK0dVMLxQkE0hnzi++H5U5WHivPK
         7u53LDz9nSTrMJHmZ7FzqqwECFmbIJQlD68etYr8cZaqjQOw2vAxdFNZrBnmAKEJV3gn
         +8hObpVZccBlXWQdyg7IrVvXM3egRtxOSiTfU5PxSJb7YuQjs8akDrMWE61qu3NyeNvD
         /6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794307815; x=1794912615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RVTkGzwp8ckIzdQmxfwAcPBKin5d3z25DmdwwACLOEQ=;
        b=AZQgt1YVcBoQ+V97YVA2nv5a4PO3RUqM2xP4IbPvhVLQHIWbSK13VKXuMJbiW9VO0e
         I7NRN7G0snjjRi0piEw14RwFSv2y+9yjXIWJ12Vk/3ZBW9FR7mr2ntnmWIxF9Xpmnb63
         b17nul7yMS/T0lLDwIttV9T3UK1mhiB/G/QtF0j15CVM5UHeVA+0mipk3eSXB6y1efHG
         1xLu2qzmyByZegWaL5xmOHCtlIbz02/Lqu4HRnR31woby097OwpNKk/NQxqmgn46ydcZ
         GbXsQKp4YOlZ2oVC/q8tIclhNlvtZKl8tc3S10e1cYTCxWD7ai/D+Yk4r/2tMYOPvNTI
         LZZQ==
X-Forwarded-Encrypted: i=1; AL+hErGFRNxHzTMzx3f0vQD6Qcrs/M7gtqE1u0OKsEdvf0iTz54Avxv+croJLvdxGV+oqTaRzVPPBkVTOEeWoz5c6aI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9dLWCbWiKddK7/aMhvNf85jJxBVInA4Fc6U8aTx8ZuOfueT2Vk
	VXsuI1s5//v0lzs+M7yzMs4pZKi4RKCXAYuMn2n4muRdc9X0L6PK8KTykYaMD2DdnD8=
X-Gm-Gg: AYBFou34i38A7XawxRSTirkfyLBq6mn+ye5qFWD0hA/S9EoKBXlqtUgFPtuwgr1PRCE
	9neKMob+v6eow4KFHWt8S10KYS3lW/yjaKqufJYKTUaKah6UgPZhGt8OzxiEBVl2m5lP8vm7LBo
	1j94UJ4RfbimtnXqNm+LP/Io3qrG4EvSRP8vX2bSqerBvwt0Cs3uMk6+JfVSJJ2e6exoUUp7sab
	giwFqz/sWDyF7XzK4hto0WgnfmdPbavvl/vmSQrZwEb2DKMTNzGrgasmNiHoQ4uWUTPLuwZffvW
	X5XUpg8NLlAD+GXRIYFzBH3ovn7oaGLbPD+S2n5E2TnCNA8LUbd8CKygfxfa12RSLCvQz+x7Gx9
	OdojoRTezWnqBC5LhRoxTf8zP6eh70pSMdEph8lB2hnXyB9KbWd6ttLXxdkd5ss6lQEr3TW6PeH
	sXe7QY8YHFsm/12GWVZ6WcHL+S0KV7vLla/o0XDK9KZOe9i0MSPQbnrO2O8eHieB0NoqH6TXyIs
	AnIACx71C+UxpAG6maVPGckyQCPmGY9E+fK8Oie829mK0lVyAqFaewb1AA4ommOgAPi4JYS077g
	oIR1t+1gOJntNNVh41yiMgZm4gmhpkjiFNopZtRytetDDQ==
X-Received: by 2002:a05:600c:4e14:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ba0233b8b5mr35312615e9.7.1794307814843;
        Tue, 10 Nov 2026 02:50:14 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835c37bdfsm4522648f8f.22.2026.11.10.02.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:50:14 -0800 (PST)
Date: Tue, 10 Nov 2026 11:50:12 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] selftests/livepatch: skip based on the test
 modules instead of KDIR
Message-ID: <avL25NFPU_pJ2tXJ@pathway.suse.cz>
References: <20261103222706.1642224-1-sashal@kernel.org>
 <20261103222706.1642224-3-sashal@kernel.org>
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
In-Reply-To: <20261103222706.1642224-3-sashal@kernel.org>

On Tue 2026-11-03 17:27:06, Sasha Levin wrote:
> setup_config() skips every test when there is no kernel build directory
> at $KDIR or /lib/modules/$(uname -r)/build. The test modules are built
> together with the selftests and the scripts load them from
> test_modules/, so nothing needs a build directory at run time. A
> machine running an installed kselftest tree usually has none, and the
> tests are skipped there although the modules were built and installed.
> 
> Check for the modules that __load_mod() loads instead, and remove
> has_kdir(), which has no other users.

This is another a bit cryptic LLM generated commit message.
IMHO, it will be much more strightforard to say that this patch
allows to run livepatch selftests with pre-built test modules
without a need to install kernel devel files.

> Fixes: 54ee3526796f ("selftests: livepatch: Avoid running the tests if kernel-devel is missing")
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  tools/testing/selftests/livepatch/functions.sh | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> index 8b26b70f92d8c..14fc9cade4de3 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -44,16 +44,10 @@ function is_root() {
>  	fi
>  }
>  
> -# Check if we can compile the modules before loading them
> -function has_kdir() {
> -	if [ -z "$KDIR" ]; then
> -		KDIR="/lib/modules/$(uname -r)/build"
> -	fi
> -
> -	if [ ! -d "$KDIR" ]; then
> -		echo "skip all tests: KDIR ($KDIR) not available to compile modules."
> -		exit $ksft_skip
> -	fi
> +# Check that the test modules were built before loading them
> +function has_test_modules() {
> +	compgen -G "test_modules/*.ko" > /dev/null ||
> +		skip "test modules are not available"

I would prefer to keep also the original tests as a fallback
and report:

		echo "skip all tests: test modules are not available and KDIR ($KDIR) is not available to compile them."

Best Regards,
Petr
