Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FE9296BAF
	for <linux-kselftest@vger.kernel.org>; Wed,  8 Jul 2026 20:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783542266; cv=none; b=uk2IsmnFw4vSlsaMdCpppq4pAGU87ZjMLWXCtPTn6YflC9/glI7sMuPNqOfBdMVmg8APBJUOIMd44H5UA8mIM3ZC35GPm8THEcIwk/6RpcL1UpoFvaE9Ky6HncMQJEgV9iDqk9r47aqOdcJnjvf63GWv+ePifYwQU3JSNeb2Aos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783542266; c=relaxed/simple;
	bh=TXXbCYEXpC+9kfz5SYw/H/+O5UyHxNvVsZaiufM/gfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=saVPgHy4+cxPUqrbTomWIhOsVtvzr4uZJ5srEoutz6V2jtDSFuU0g45vQuNWtTxE4jRyBIDg+LHKD9zJs8xxj+meu5URt2hW++Ml774CeiRMeTIlL7Jn3TRnGHjdH1FvZSMz4R7flaiZ1mSEG6KMATsHFHJB/i+HRf03FuwwnS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nx8Dr/ya; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nx8Dr/ya"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493c733f15aso2096725e9.0
        for <linux-kselftest@vger.kernel.org>; Wed, 08 Jul 2026 13:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783542263; x=1784147063; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Hqm+SrTRL+/Dklgpg/R/6ZCv3REs66MksaYhdwdmzU=;
        b=Nx8Dr/yaRyePKQXOircY3Q9LMIG9zAKBVGsn6XvlqPf12gzwh26mQ57kMmx69AQ3R9
         d2qDjMPa7kMTeNz28ZPQec2WUhIVUR74fI3+watgu+xB+oog1H+347Ld4jyQqx7fkY4n
         LNgSCpX3GeqQ1Xj/IIqGBYbBw9Dvnvxv/0VRlVuAV+WjZNpgEHU83dq0NAXE77Wsa20A
         5lwiltGCMZmgiOw2GjACWq9TW7AOLoGngQ8wWGxoyvPNzXl3TLxaLzF65xRScEmrH/85
         kstVBblOVXOm3SlBPgFJvnCFMMsanxVYg/WUXbfE1pbq7SHewKFMcT8y216R01jt6LeR
         9wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783542263; x=1784147063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Hqm+SrTRL+/Dklgpg/R/6ZCv3REs66MksaYhdwdmzU=;
        b=OleUcaPeP88p6rz3s7dz5yET5i2zxv+k93CGDDbvUiufcX2zy9lyedybkmTnI09rgZ
         t763NVp3pb0K3uqjhj5KrZdXBKKCoqIhN1jvrY2BnRxtwHWzo1yXEscct9WUC7askiJ7
         0pngRbGrs5r308lJ5n99LtfURtARvnG5C8IzUHQtaS1GGACSEiE/TyxGGzoEHWBmsZvD
         ab9fcNssxn4Atp4X6GhwHZGs7Ymriko7LKxQRyA8qfaYurxwCaLa2NtXUC9kYRWqGVe+
         jrRcqYJCsLp+yBwZb2Uf8XRxFeJVwdS5vgfCNYbIS08QrL3UTQpVRF7SRbfhJYr3mBCD
         WyiA==
X-Forwarded-Encrypted: i=1; AHgh+RpE+d7mOL4FjYq8Z+ndtuj4B1DtlqJJdfP2PedPGsdCz4hgWbG8Uwf2fDrUJ3TziGcXscg1RrffmVOuN02HKcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIPJRbzhHDA6FCN7sV2tTg2LbM4Yp6hYlsPU3iqZglUBKoWSp
	NU899maNR2pOSsuQZiq1AduzzpjlmbcflJzi3sl3MRjy2mGfMQnJnEjn
X-Gm-Gg: AfdE7cn80YvIsl9YlU5bsWMpXyuzZI1h8JV7Ul7m8CEA8+5kjgi47fGA7+OgZYfUari
	Rm0cC+ZMTHU+MoVg9Rgjl73JLzNvXq7abkLVMsCB/aKy2Zu6qkEIzT/d8U7B4/T+fPI7NYE4i2T
	fxN36s9M8GH+a31IFhzk4DTRO20aU/7xh8qlf1qi2jaSLNgAoypcrOwGMnmpbur5CpzeiuCyt9h
	yP0kc726LA2PCqxKbjjfe8A5c7WCFGQfqxbc0nARIdYBtv+dzlYbEOr8VGGrmF9zT3YbziGwwwH
	O/A4pFnCJEOsOdPfoJLzUudDJC4ylbFTsPd/qpNkv51TPg/xitNat+uvlXS+vvJe7uDnemOKtHj
	qEI0SpgsbB3tOPU7jm/juScir/bntss63mFwCMHFAPa74SAm6oHxj/ysjgAldaL9LbXlJ8ctMa5
	GS2ScKBuU3aFmQ9VjYLq9QMjmdQsUBEpX2by+7xAvl
X-Received: by 2002:a05:600d:8445:20b0:493:cd3f:d097 with SMTP id 5b1f17b1804b1-493e68a0f7bmr32761835e9.12.1783542262863;
        Wed, 08 Jul 2026 13:24:22 -0700 (PDT)
Received: from archlinux ([143.58.204.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6df417sm4407995e9.8.2026.07.08.13.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 13:24:22 -0700 (PDT)
Date: Wed, 8 Jul 2026 21:24:20 +0100
From: Andre Carvalho <asantostc@gmail.com>
To: Matthieu Baerts <matttbe@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v11 7/7] selftests: netconsole: validate target
 resume
Message-ID: <ak6jtwbct3C5lZPA@archlinux>
References: <20260118-netcons-retrigger-v11-0-4de36aebcf48@gmail.com>
 <20260118-netcons-retrigger-v11-7-4de36aebcf48@gmail.com>
 <f398373e-2cb4-4649-a491-9763df94d98b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f398373e-2cb4-4649-a491-9763df94d98b@kernel.org>

Hello Matthieu,

On Wed, Jul 08, 2026 at 05:50:53PM +0200, Matthieu Baerts wrote:
> 
> > +function trigger_reactivation() {
> > +	# Add back low level module
> > +	modprobe netdevsim
> > +	# Recreate namespace and two interfaces
> > +	set_network
> > +	# Restore MACs
> > +	ip netns exec "${NAMESPACE}" ip link set "${DSTIF}" \
> > +		address "${SAVED_DSTMAC}"
> > +	if [ "${BINDMODE}" == "mac" ]; then
> > +		ip link set dev "${SRCIF}" down
> > +		ip link set dev "${SRCIF}" address "${SAVED_SRCMAC}"
> > +		# Rename device in order to trigger target resume, as initial
> > +		# when device was recreated it didn't have correct mac address.
> > +		ip link set dev "${SRCIF}" name "${TARGET}"
> 
> When I execute the test, the "ifname" bind mode works without issues,
> but the "mac" one not. From what I see, the socat process doesn't get
> any UDP packet when expected. I wonder if the problem might not come
> from here: the interface is disabled before changing the MAC address and
> renaming the interface, but not re-enabled at the end. Is it normal?

Yes, the expectation is that the target would be automatically re-enabled by
netconsole. That is why we don't 'up' the interface here explicitly.

The problem is that the test has an implict dependency on interface mac address
changing when we recreate them, which is why we have to do this whole down/update/rename
flow to trigger the reactivation in this case.

> If I add 'up' at the end of this last line here, or if I remove the
> whole if-statement block, the test passes.

For cases where the mac is persistent (e.g with systemd MACAddressPolicy=persistent),
the actual re-enablement should "just work", which I suspect is why it works when
you remove the whole if-statement block.

I think to make the test more robust to such scenarios, we should skip the
if-statement block when we detect that the interface came back with the same mac
as previously. Something like this:

if [ "${BINDMODE}" == "mac" ]; then
	CURR_SRCMAC=$(mac_get "${SRCIF}")
	if [ "${CURR_SRCMAC}" == "${SAVED_SRCMAC}" ]; then
		# Interface came back with same mac, no need to restore
		return
	fi
	ip link set dev "${SRCIF}" down
	ip link set dev "${SRCIF}" address "${SAVED_SRCMAC}"
	# Rename device in order to trigger target resume, as initial
	# when device was recreated it didn't have correct mac address.
	ip link set dev "${SRCIF}" name "${TARGET}"
fi

Could you confirm if this fixes the selftest in your environment?

> The "network logging resumed on interface" seems to suggest that the
> previous patch of this series here, commit 220dbe3c76ed ("netconsole:
> resume previously deactivated target"), managed to resume the previously
> activated target, but not in my case.

Thanks for including the logs, this helps quite a bit and I think confirms that
the interface comes back with the same mac address as previously, and is indeed
resumed, I believe the down/update/rename portion of the test then drops the target
and causes the failure.

> What I don't understand is why is it working on the Netdev CI, and not
> on my side. The main difference is that I might be missing some
> userspace packages -- but I don't see what can be missing here, all
> other netconsole tests pass -- a specific kernel config, or not applied
> patch. Or something different on the host -- in a container on my side
> -- but there shouldn't be any interactions with the host here,
> everything is happening in the VM. Any ideas? :)

Netdev CI executes with MACAddressPolicy=none (which is why I added the if-statement
block [1]) and I think it might explain the behaviour difference.

> 
> > +	echo "Running with bind mode: ${BINDMODE}" >&2
> > +	# Set current loglevel to KERN_INFO(6), and default to KERN_NOTICE(5)
> > +	echo "6 5" > /proc/sys/kernel/printk
> 
> Can we remove this? Without that, it is hard to understand what went
> wrong in case of issues.

Can you elaborate? This is typical for netconsole tests and I think required to
ensure the write will show up on netconsole. I'm not opposed to changing it if
there is a reason, but we probably want to make it consistent with other tests too.

> > +	# Send the message
> > +	echo "${MSG}: ${TARGET}" > /dev/kmsg
> > +	# Wait until socat saves the file to disk
> > +	busywait "${BUSYWAIT_TIMEOUT}" test -s "${OUTPUT_FILE}"
> 
> In my case, the script was stopping here, without any message. I can
> send a patch adding "|| true" to go to the next instruction, and display
> "FAIL: File was not generated.".
> 

This seems reasonable to me.

> > +	# Make sure the message was received in the dst part
> > +	# and exit
> > +	validate_msg "${OUTPUT_FILE}"
> > +
> > +	# kill socat in case it is still running
> > +	pkill_socat
> > +	# Cleanup & unload the module
> > +	cleanup
> > +
> > +	echo "${BINDMODE} : Test passed" >&2
> > +done
> > +
> > +trap - EXIT
> > +exit "${EXIT_STATUS}"
> > 
> 
> Cheers,
> Matt

[1] https://lore.kernel.org/all/20260117092227.741cba3b@kernel.org/

-- 
Andre Carvalho
