Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582265;
	b=hKeQKRHx7vdIP4Bv7mnFgR2kwhAVumaZ/06xLMR1IXXSPv4rVQZ5+LOqYPWaw7Wr6Lus
	 BPCD4RM2xrhOXfpY5o8Wr3d2fnBZDo/CR8tPf5sJu5YrbVCXdRAUnA3+FKJlCrJcdeWPl
	 bDBjYgf/dxJ48AsNdLJkF3alwpVag55fsVHckcZTxeiQxaBfg2G5wr5WUMII+gphgSZxT
	 azq2pqnUxHf4l8QQA7gwGFj3pFuKRfoX+6i7p0b5h2N3hazPsolVNpLMK/igXhtJzP6py
	 jP/pftLIWwPiLlqcMF6umvJV+dVGf9tdHWqJYk2IgOUtqglFI6ZnOqXlsD9nLoppoIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582265;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
	b=C4dpWnNxzpRJ7g/VcrZ7hX3xakZAwGpxoD9zVJXtW6vZNJUUfkeW6ybVEjCtQFOGHvQd
	 u1MsJSM9sTm4UW531+ebvBuEO8dk3YDpj+s/V1olGE/2YfCwaNmcvJO0VTPViBqmgXCGb
	 LCuqPMsD3eFSIhnUKRh5bT4CfHXsDmEWO0oheJTJTcyqROATYr+XkhVDuVlYPz8/L9tte
	 8mZxjmFTcsfl6FtY/a6d5UdttzIuY9Eh1BNEsZ9f/PLatIhNjpq7uvtVYBZnvRkdLClk0
	 UUFGq0jqzb5fks3mk9j0KWZky+3l6xWpOxxssTgAvT3Dbnhu9be9C5aG7gH0o7SqWdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fr9UEepa;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DvUd57AJ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715CD606A330
	for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 15:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 715CD606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fr9UEepa;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=DvUd57AJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794582264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
	b=Fr9UEepamPBOJU22LWErbMatEYI7yXVpttMIbgCgEq8En8QMD1SDx2I2jqGFQ0QzGtEPln
	OqD3HGc0Em1YjpuWgt93cWCA5pK9vpUgChASLhKev4wAlA5GI+3UCaHYNWWeD3s2X+aS9M
	tZgD4+jNnuMybfLdMtfewPhOGJUlkYc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-IMtVU_R7MhSgyHlWhWlbyg-1; Fri, 13 Nov 2026 10:04:21 -0500
X-MC-Unique: IMtVU_R7MhSgyHlWhWlbyg-1
X-Mimecast-MFC-AGG-ID: IMtVU_R7MhSgyHlWhWlbyg_1794582261
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-492b5408dedso553869f8f.3
        for <linux-kselftest@vger.kernel.org>; Fri, 13 Nov 2026 07:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794582261; x=1795187061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
        b=DvUd57AJrozlGhVyMRLhEIZVRbNiJOykXOUj4BLqPD/33eK7QVfWz/lW20XR9JFklI
         etL7EvVjHMUOzINt2veI/BVDEYQS48fHyorV2pn5DXZI/N+pJjYFZwYrpHSOrVEP+sWM
         8f3lgDrGcl1xnxUCnUqXbi6wBM9zCt6oSfcnMg+7h21x5ewoHq2PrZqYTZDwdTY8xk2N
         chcF0wMZj4YvzupHWxqovkNDJjDv2/ZeUE/gGb0aTYb0HSByduuy0g9le5tXpKVRxs1F
         E+rBEmxYNr2busfNv9/JuX1uCb0e9yNL4FTz/lqwKVcdtqJG/riRKp65UB/94tlkPNXP
         Os6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582261; x=1795187061;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBm4qF0y5CrLsLbvNlcB/jDiXe3RpYSa+rFP+kdVVgQ=;
        b=zA3zMzccHQnp81T8hpvY1jrzEVEL3iwlTx7xvT5fx1b7MSL1AAaFHhR69jj0uioYq/
         IxsUyvThgfkavLIQpR3XZq6SQWgswW1kcKfRQXmL3V3L5pMyaB2+vt6I2rZ+Q/kuhluR
         iqG5VcihKkqEXmH2MuFwhgiL98Yys1XUdZomBQ4l5meBcQZmkbX5sqGmuLHxhhMzafWI
         lU6mO9PxX5qmPGDob/vc1r1MS87xloJ9AeKgdl0TuBnBNGpqI1ZSII0uL0+xuO8jHfvY
         WBUjlDrNiDpdxC8LeYeOb/p+XAH63jj3ohpV2AVwFQWrNBa+v1lWqhxn7Dp4Eq6kQ56W
         TzNQ==
X-Forwarded-Encrypted: i=1; AL+hErHH9lSq6CfvLHj129D5tZdt5Sf/jxU1CLUBJzL8UD/EIUfrh1TvEfJbR6QbSQ5D1M4g39ogyrl3RZtg6WoAUFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gjAyBJ3nuLZLRpP5fsaYG67tVATdX78co8v/1+dhB/VenLcZn
	dlXPTlRzyCpGOfHWZMduwCM50UAx4f4/GGbB+T5/nIRUSUXRwjV5vVJ6x/jaBac+pR86/0PHUIZ
	NIEyaVxaMYM+UeThcWRT767igK844v0JZM68gjN4RHXZvPUPi1yf17p537k/eusvkIR251Q==
X-Gm-Gg: AYBFou2leK1lyEKAtj9QKXlErOKKtcXxB1Sn3apREt3cM6LySYsfDxRSK8K0eM5mUB4
	X7Ln88mfg/9fV4OTH+noh7vGMPkqPBMsudwjVkqRXVQARHSBNWA7QbjvGecDCrPezi6fGKm3i2M
	Mz7zGjjOMRqco7x5Gmc/Nw6C5JK79AK/JuG9X0+FcWBXmaatIuauizpjNfNeQZJzVrEpe5xib19
	ZiYpVR02TKXxE9KsuUd/yVaWlzNfueV06jQe0K3iFkhzk5O/8Kjncf3O6NWRZvzOuux+bIDNnYZ
	B14pHCHXN/gYOv1Ke6AD7RfkrhyVdN7aeAkFtL9Anc0lhujkPZ9pq8Q9zbCae+qq+eNXGM5SyM+
	s3dqc9bPBi8PmB6hcrBT/yxFqPjN8UotyfRuDjUNwqMyNMOnCMoa7J/vrLhBP7e3o9tIc+6L3Dv
	atbW0=
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr59742615e9.11.1794582260653;
        Fri, 13 Nov 2026 07:04:20 -0800 (PST)
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr59741585e9.11.1794582260021;
        Fri, 13 Nov 2026 07:04:20 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.158.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm65285595e9.13.2026.11.13.07.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:04:17 -0800 (PST)
Date: Fri, 13 Nov 2026 16:04:14 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, tglx@kernel.org, will@kernel.org,
	boqun@kernel.org, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com,
	kprateek.nayak@amd.com, luca.abeni@santannapisa.it,
	mathieu.poirier@linaro.org, longman@redhat.com,
	ridong.chen@linux.dev, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, shuah@kernel.org, bigeasy@linutronix.de,
	clrkwllms@kernel.org, parri.andrea@gmail.com,
	m.szyprowski@samsung.com, kayracizmeci@gmail.com,
	weihengqiuu@gmail.com, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v5 26/29] sched/debug: Show the deadline bandwidth of
 each runqueue
Message-ID: <avcm7pyPqMx_r5Pl@jlelli-thinkpadt14gen4.remote.csb>
References: <20261108185406.1549770-1-mathieu.desnoyers@efficios.com>
 <20261108185406.1549770-27-mathieu.desnoyers@efficios.com>
 <avWWlEGGqVPYkuZw@jlelli-thinkpadt14gen4.remote.csb>
 <bcf6f03a-d596-4afc-9d3f-54219935bc2c@efficios.com>
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
In-Reply-To: <bcf6f03a-d596-4afc-9d3f-54219935bc2c@efficios.com>

On 13/11/26 08:36, Mathieu Desnoyers wrote:
> Hi Juri,
> 
> > OK, but we will still not printing additional useful information like
> > extra_bw, etc. Not sure if you are aware of tools/sched/dl_bw_dump.py
> > drgn script; maybe that is already useful for the needed additional
> > debugging information?
> 
> I did not know that script, thanks. It shows more than this patch does.
> 
> The two lines are there for the selftests. params_waking and random_mix
> of deadline_bw_test read running_bw and this_bw of each CPU from
> /sys/kernel/debug/sched/debug. A selftest cannot rely on drgn and on
> the debug information of the running kernel.
> 
> So I would keep the patch as it is. I would not add extra_bw: no test
> reads it, and your script has it.

Works for me, thanks.

