Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE4234D3A9
	for <linux-kselftest@vger.kernel.org>; Wed, 21 Jan 2026 07:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768979256; cv=none; b=nC0aN5aPdWgqAucxRDSDc9kPjIHDGMK2ZHaxV/RnHvwDD2K+OdHjve4BtVR0rpmhWUQAgacpINbiP7iNhK/G+oA0LuCJJZv2Y07MoC6PYcHdzlZbsbs/dTZ9uXbDh0CMgvIxqWb9kZT4Y8JYJ2CxbDFQVuqXAIVm/JI0Kz98f7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768979256; c=relaxed/simple;
	bh=BjEonW32c5YOMq0hqq7Xvkwknsp7bLBK5sRV2QqHoDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kyg/uvn515lstcbpRS0zCQMNArxWZE8dU0TDF5XudBm5s62ya6NyDlw8D9ZfYfjLhxnelOhVP22FJFgTiRrMDu2zOi9e6RQao+e3ZoZLbT8//70WIMRu7HSplOB/I8J/5y4GQQRmxWQpkojp3EuP6idCofVB5xS9jxALvhJmQd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f5LApCM1; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f5LApCM1"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-50150bc7731so93801811cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 20 Jan 2026 23:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979253; x=1769584053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dr4ikofTW2/lOylz+wqvxKyTxo3lmrOIQRlztmAAggk=;
        b=f5LApCM1wIOhjmIk7Rahs5Yu7yUML6ZTM9AiB0KopMYu3uTKAistnEnf+qUn8FmD1B
         EhgYQo49rGzT35x/It47fkMDOyFwPKuiyGeg+A1rgcGc4SjSeP3vIYryS2N5Ty5Kp818
         e10NJ/HsumX5CrvGT2r5tIcwcrdtfKg4Dy5YUlL5Rl1GR3zDrDgJJO7ck7gHEsB4+9eY
         52h/vn2vwSp3aanGNLX7g83oUAYf3Hg5f/xnQ1eZETXrIoFnbMlyiplDxwPVt+yV2WCM
         lnFBxkuoBitRKriBZQlnxLOrEnKPDTx03HTrI83ePjfsqGlotWikPZiSWzm85tEWnHqu
         hncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979253; x=1769584053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dr4ikofTW2/lOylz+wqvxKyTxo3lmrOIQRlztmAAggk=;
        b=AlywqJUYTbYbvhDJ2xMZPUTmkHSoHc75SuLtXFT3teAegNXEhnET3zm4l1AtKMwl4q
         xizpWpa1EPB/mrj6fmLwlnyzGQ6nOP2zuYLyWB22AI4XpTeB71B1FJ0N32ERqdYZgdb6
         3jAijAJaxveVYiXFh+OmBjDEFfcRrtSdG84bUV9whAvlIyjWRUDbBjHLgZcgePxSDhMm
         vSy8o2WixYvszZIJjNRrk32gmSjtAgvq8td3ZnJdUKQQOD8T2mhSCnuN8bfAkgzCOGAH
         kH7VrinYH5D7Dwpx+SG42LXKNbGIsIiDZwsvYXXNQQzR2tyam9m6DnAGzqzKrKSZLmMp
         MXNA==
X-Forwarded-Encrypted: i=1; AJvYcCVg8bZFAQa+j7BH/g2ZsmChXPVcM9PgJOen0GeVOnhN5BkpK/Ourg+jx+91M9RuDUZdzNwTDZeO9xVyrylKOO0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPfDmLP7Bau3vlU1tqLE1pTBeP55aBUYIDBLaNvYiZ+SkEyGHX
	29AcAK9ncZIfTO34bbHVxTDd5LbnjhiIXLFIT1/H9lMUQmYJJsA5fAzc
X-Gm-Gg: AZuq6aLwcwH1W2X3V6+4YRSc9epMTsoZrrrkKzSFCJyLEDBaa5ReLuewW0LVZoFkBiA
	HSSQaFeXrOl27SHLqJwbEnxvdGYBxradZZIm7wg7F2B88QghWNx4quF//Pvbt3x52YiTf3Xqa73
	1lo5H3wPMXHiAp6ZbYYx497ihbi6/d9bLDx1kfgwnkaW2rIsgT8b/WBRPITMxMPsTQuysXCk04R
	9oMZkIa33mGa1Vlcp6XAf0xjmuwEt826vmVs8r28wEa0ig9kIA1+B7Ajy3ffIuo0IJMzB0z/QbA
	/MRNsO15OnMuiSokXb6wxxWcuLlUsPoqz5s0fwGvov7KUm8HC8Q9WXfcpW2eXjOGw5cHEbwls9E
	0lOatFVxAMF4dPHbwnm4HFpoD2ya/774hGOFv5+LFdLmQvEdJueSSkdOhBy03ni1awkCHe7M5pg
	lnMIZI8f8PT0hPX2d8BWigt22hhk78PYetGQg=
X-Received: by 2002:a05:690c:ec4:b0:788:1086:8843 with SMTP id 00721157ae682-793c66b7cd1mr130884437b3.2.1768972588159;
        Tue, 20 Jan 2026 21:16:28 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:74::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c6888b83sm60922327b3.48.2026.01.20.21.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 21:16:27 -0800 (PST)
Date: Tue, 20 Jan 2026 21:16:26 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: sgarzare@redhat.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mst@redhat.com, horms@kernel.org, bobbyeshleman@meta.com,
	corbet@lwn.net, xuanzhuo@linux.alibaba.com, haiyangz@microsoft.com,
	jasowang@redhat.com, linux-hyperv@vger.kernel.org,
	pabeni@redhat.com, kys@microsoft.com, vishnu.dasa@broadcom.com,
	longli@microsoft.com, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	stefanha@redhat.com, berrange@redhat.com, decui@microsoft.com,
	bryan-bt.tan@broadcom.com, eperezma@redhat.com, wei.liu@kernel.org,
	davem@davemloft.net, shuah@kernel.org,
	bcm-kernel-feedback-list@broadcom.com, edumazet@google.com,
	virtualization@lists.linux.dev, sargun@sargun.me
Subject: Re: [net-next,v15,06/12] selftests/vsock: prepare vm management
 helpers for namespaces
Message-ID: <aXBhKlAxxAkvr4/u@devvm11784.nha0.facebook.com>
References: <20260116-vsock-vmtest-v15-6-bbfd1a668548@meta.com>
 <20260121025420.1999992-2-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121025420.1999992-2-kuba@kernel.org>

On Tue, Jan 20, 2026 at 06:54:21PM -0800, Jakub Kicinski wrote:
> In case you need to respin..
> 
> This is an AI-generated review of your patch.
> For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> ---
> selftests/vsock: prepare vm management helpers for namespaces
> 
> This commit adds namespace support to VM management helpers and wrapper
> functions, requiring callers to explicitly pass "init_ns" for the init
> namespace. The commit message states "No functional changes for existing
> tests. All have been updated to pass 'init_ns' explicitly."
> 
> > diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> > index c2bdc293b94c..1d03acb62347 100755
> > --- a/tools/testing/selftests/vsock/vmtest.sh
> > +++ b/tools/testing/selftests/vsock/vmtest.sh
> > @@ -135,7 +135,18 @@ del_namespaces() {
> >  }
> >
> >  vm_ssh() {
> > -	ssh -q -o UserKnownHostsFile=/dev/null -p ${SSH_HOST_PORT} localhost "$@"
> > +	local ns_exec
> > +
> > +	if [[ "${1}" == init_ns ]]; then
> > +		ns_exec=""
> > +	else
> > +		ns_exec="ip netns exec ${1}"
> > +	fi
> > +
> > +	shift
> > +
> > +	${ns_exec} ssh -q -o UserKnownHostsFile=/dev/null -p "${SSH_HOST_PORT}" localhost "$@"
> > +
> >  	return $?
> >  }
> 
> The vm_ssh() function now expects a namespace as its first argument, but
> run_shared_vm_test() still calls vm_ssh without this parameter:
> 
>     vm_oops_cnt_before=$(vm_ssh -- dmesg | grep -c -i 'Oops')
>     vm_warn_cnt_before=$(vm_ssh -- dmesg --level=warn | grep -c -i 'vsock')
>     vm_oops_cnt_after=$(vm_ssh -- dmesg | grep -i 'Oops' | wc -l)
>     vm_warn_cnt_after=$(vm_ssh -- dmesg --level=warn | grep -c -i 'vsock')
> 
> When called as "vm_ssh -- dmesg", the "--" is interpreted as the namespace
> argument. Since "--" does not equal "init_ns", the function sets
> ns_exec="ip netns exec --" which is invalid. The shift then consumes "--"
> and the command becomes "ip netns exec -- ssh ... dmesg" which will fail.
> 
> Interestingly, the v9 version of this patch on lore correctly updated these
> calls to pass "init_ns", but this change appears to have been lost between
> v9 and v15. The fix for this regression is present later in the series in
> commit 3ae984505e00 ("selftests/vsock: add vm_dmesg_{warn,oops}_count()
> helpers").
> 
> [ ... ]

Got it, thank you.

Best,
Bobby
