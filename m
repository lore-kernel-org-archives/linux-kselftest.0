Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB16243E9CB
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 17:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519451; cv=none; b=jZ5FT7T+DxTqUuewB37bEuMCa2Aa55bs1ACc+jdimyUAIGkatGgDZ/CjImo9zNFEkh7ClFx5weWO7vsVCSNoH1vjBwa/ZkT/DpW9H+wglH88DcpJYQ5KJgc1ZcZJCORh7oGbawv9arNKSnNF+GeilfHT4WEP8wEo+AOIA4aIJ9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519451; c=relaxed/simple;
	bh=xEf0DcTeuh8O7q7xkn5lS+B/P1HAUfQRMFjpy4xw5iQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ufDOGUprlh329tJ9H2SzRY5khG6vVl5xqupLXS5cnUFuRPl7bCBSWbwFexzkqWOH+AZYngkXSc7YUjW6FNB8gzvKF4VcN3kadgqAwjDSLVLOSZsC2V5CrqNJ5j0N4X0tA0KfI52bcg8OQTguEtfxHiPneP1CbgSCaf6EhuiRTOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T4kf8jSe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T4kf8jSe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a74032ff8so3405020f8f.1
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778519448; x=1779124248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4WseMM2s1lBw35z6Gvcd4yWHkkkXHH2E0/2CJvqDOO4=;
        b=T4kf8jSeOB6D1KH4+hz17L8PlZJvkCcLExTX6fIa3So+FxmRGa4ATaLAVDI6tLpw7G
         Rl9rdWd9+QTz3OPYpx1XD4GLjTTj8gl43dhMFgAeddowgyy6TX2HhsKBzwgFF9Tme4UC
         AkBz1IuOF+jSnHtpcdl25bSI+8+aWLlziCiPbMuz1Y/pFDiFMFIOaOvsAoT+FC1X1+FZ
         gdlnJuMHpgWlo/rZyHtvLb+eWRhyHu/3Kx33HgER2+YuJGQ3Ty+2waY5fqTwgaSBONcL
         uvEoy9bD6ZVRW1Mx/JrHTWsRD1llv7x/I+eMMr2sRdoVE+71UHzuSuv1HFmx3f3RXE6P
         uHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519448; x=1779124248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WseMM2s1lBw35z6Gvcd4yWHkkkXHH2E0/2CJvqDOO4=;
        b=XuLZTFox9Ry5Y2+8RExVKlql83XlW8bQGKD3jdwQyVfDugO/m6j9x+AIoeNc/NxF+K
         NjCkOOY9XAUhlTCjQDfUrV3bws4jF8PENWQeGqo5YL7LzUwUn3kxGm4bmwoIGrv7zzqa
         ag5R1rTWLjZAWvXZD3xlZu9+tgXkb+2oOVv7045M1kS4kukzJMpiNbcU+rmWmDKmFT1L
         nClqZgKR9AIOm6cLfpAnsK6ruX+f1VgqgCeY2hiDEOtt89qC1RwYnHZQD631++93iLbZ
         twhXOwB6FQYiBm9lRUlUxx4kZsapGxXHJYpksPEyn38zZ/bgOE+ImPVmNj9bzwjY1kpT
         zZVw==
X-Forwarded-Encrypted: i=1; AFNElJ+y/8ealXTUtKGEvSsRE7AK86vTmOHbm4ckmQLKqetW+z4w0MPBfGnSC5CDLq5llaB6QjtTxUNi0q31HrMFoTQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbRcAquTelIR4aco2OuE6zsWoSKhuFuAI45TQLNNVyq8QrpJo
	bRSe5eWWRi0/1NZMbMmNdo29PxKcIPlWwiO9eXAzIxOV7oivHgce1qJ2qaSEI0FQ2Wk=
X-Gm-Gg: Acq92OEKDcjpl0OkQXQ4MaD9ep69UuwyeT2s3MdjInR4/CrdNWv54AadC2Sfkper3eC
	MQHiimUS16967ljA/7WEKnaFOkYY74EvyCYiPwGRD7Kmuk505S9Ml1+pAuEbzwIiYNr+yL/WfE/
	3B5S2MTW8qiVrYyRhCE8z7Nck3K+Y/B3da2Ywvx8HliV0ORpEwJriGXOy1L0tMYy5objOMp8s2P
	FQD6jAB+Xm6YcxE0xEugdqWQ1Q8MXRTD+5pwYrRVch6xmMQXuLiwdBpADXmovy9U0fwMx9NONGD
	f/vHtPBb8SuY+zzeFdP1ylvPmyQ6hjuVwzQNoRZMgj50lazzPrZbxDXP6kcTCBoD/1ft+WYA0pD
	LRRX3NKP6wZm/NXpdAjoDc711xgRMgzjZW1J1F+wH4TEJhdY7OEIUBpYl4Ykz2oqflzfU6rLXNs
	efu70P+6TCGtPmm2uUkw+WKhpC9NWboHnoX2EQ
X-Received: by 2002:a05:6000:230e:b0:45a:c0e1:37b with SMTP id ffacd0b85a97d-45ac0e103bemr696373f8f.32.1778519448144;
        Mon, 11 May 2026 10:10:48 -0700 (PDT)
Received: from localhost (109-81-87-110.rct.o2.cz. [109.81.87.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491bae13csm26175978f8f.29.2026.05.11.10.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:10:47 -0700 (PDT)
Date: Mon, 11 May 2026 19:10:46 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agINlnNN4ubZgyiN@tiehlicka>
References: <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
 <agHm9Vj7bPPCRS1g@tiehlicka>
 <agH7_QBPLWKTZucB@laps>
 <agH_bGUTvWm2h5g4@tiehlicka>
 <agIHsN9tiIHnVTeV@laps>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agIHsN9tiIHnVTeV@laps>

On Mon 11-05-26 12:45:36, Sasha Levin wrote:
> Could you describe an existing infrastructure I can use here?

I think it would help to CC maintainers of subsystems that provide
kernel modification functionality. They will surely have a better
insight than me.

> Let's look at
> this recent "Copy Fail" thing as an example.
> 
> I can obviously build my own kernel and enroll my own key, but 99.9% of our
> users won't be doing that.
> Livepatching, or manually building a module that just injects a kprobe is out
> of the question as we previously agreed.

Onless I am mistaken you can enroll your own key through MOK. But you
are right that this is an additional step. But the real question is
whether this is a major road block for users of this specific feature.

> systemtap falls into the same bucket as building my own module.
> 
> BPF doesn't help because bpf_override_return() requires the target to be on the
> same within_error_injection_list() whitelist as fault injection, and the CVE
> targets never are. Some of our fleet doesn't even have BPF enabled either, but
> that's the smaller objection.
> 
> I can't use fault injection because:
> 
>  a. It's almost never built in production/distro kernels, and I suspect this
> won't change.
>  b. The functions I need are not whitelisted.
>  c. Even if (a) and (b) were addressed, fault injection would still need a
> securityfs front-end, a cmdline parser, a module-unload notifier, a taint flag,
> and audit on engage and disengage. By the time those land in fail_function and
> tie into/refactor the fault injection code, the net diff is bigger than this
> proposal.

I cannot comment on fault injection imeplementation details of course
but I have to say that the whitelist nature is something that makes its
use very limited. Maybe this is a good opportunity to change the
approach.

> 
> In my case I can remove the module, but not if I run a distro that shipped with
> CONFIG_CRYPTO_USER_API_AEAD=y (like RHEL/SUSE).

If you look at copy fail[2], IIRC algif_aead, esp[46] and rxrcp are all
modules that could be blacklisted.

> I can use "initcall_blacklist=" hack and reboot, but as things stand today,
> I'll need to be rebooting few times a day.

with your just disable some functions in the kernel you might need to
reboot even more. But more seriously...

> Even if I'm okay with rebooting that often (and I really really would prefer
> not to), this doesn't solve the issues of a larger fleet of servers that can't
> just reboot that often.
> 
> What am I missing?

For one, you are missing more maintainers of code modification infrastructures. 
-- 
Michal Hocko
SUSE Labs
