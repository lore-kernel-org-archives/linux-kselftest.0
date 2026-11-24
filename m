Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795507670;
	b=inv01bt3/9WUa027PT5Y8J6DuJs8OMq4kErLsYad14sXsdPp2PzI04Yqa+TZSvC5IRKn
	 7qnUv1ZLBbsa6lKgU9zajQH7q3DgXniv8wj+bjI5z0oXJy1fyTbeLvKZkKVyPW/KFKYMt
	 MQeyMGyX9SETN2UdvSzbn4PrQoQN+Yc+Vu4isHkeZBjqB/TWFD4d+pD8GVkczhChZ+ZFr
	 k48jHUU+5gmve/Y55q4hYDSTM9NuilYLFsbutfcHr/aMyHJEm83N3Uzbw17CHQXzrMfQ6
	 aeI1gD/Nh0MXVVFcxUPf9IF+wY+NI9cxVmGni7YnuJcPFmHMr5F5i4OxWw+EwW6lt8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795507670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SAzq4Pj8e0zb3UHPXLnIAc9Sz0C1D/vwNL2mT0uaK9c=;
	b=F4PhzXqRmoKLZJoxe2bPpbmttVdcUwqPWewo3eFzTatvXOyfOEZBFtrgoFk3lDgexSNY
	 2YDjbaD859dKtF9zS7lzEDmCnOQVOjNDigZmn7zuRWaIdPwmgg1Dg+sihvlHf/9mL7V6R
	 D0SCftpi2RpXJ20yH0z3xNN7NUkkz94J/IJ6fInoqqTxum0ip5g2NfckJI8fevyKh8qz3
	 LNedREaB1QuewJrMCG5ujaagpjZK0sTjOPykBWNg/Swinp671SAwnoJVGnSfD1csfeTMA
	 iA/7LAr/3dMduQvIalMDv+L3Ll8135SvdQwEH1KEQ8+D0xZNSQ9m4RZBmbh3434+CoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URHcDCqN;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9914606A31E
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 08:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9914606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URHcDCqN
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so26312715e9.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Nov 2026 00:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795507668; x=1796112468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAzq4Pj8e0zb3UHPXLnIAc9Sz0C1D/vwNL2mT0uaK9c=;
        b=URHcDCqNAj/K1RTMqvqTmP6m6Hstou5AK0HpoYfuZEGc0Wsb42mg6qK87kW8Mv0Hki
         EO784cMZRk28KDzVrHDXUUZHYm+x4Qp9H3Mj0jBUi5TaQk58/aCooJTpv7oXd90yNpvB
         OVgJklYVX/Yzkw+GwX8Kuc8TFoHaIU7yCZEzIA9epj1W/G71WYWfLiKHpixgRK2d9syT
         Mb0vqzsdiHFHlZ9GHg/3z9apyvNlwg+6ig17U4c5nvPQUPfbli9Tusq3/WPFsOPMrftG
         a1kKe+yFSTUFaxDECAXF9WhxQCsAiYU+2QwF2f9e6vlvmJ5C1ACrh2+Nrq6tX/bO9ST7
         bkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795507668; x=1796112468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAzq4Pj8e0zb3UHPXLnIAc9Sz0C1D/vwNL2mT0uaK9c=;
        b=hi+pCZcUjQGVrzmn/APrvZscTqHsldVzehco+b//WvzYpPXkEiYIIefx1CyGW3Wb+P
         oUOEsEIAV4njA+34KMENsS+ggvM8jlnz0KiYden68ujqOW68H8dKDsAjG5XRMF/dERHU
         WZla5l2v99oLZvjn/10yYFLHT4G6dbD0AfeAmYRvkDMG2CdC7mQbqyoEBNpe7GEmOxIO
         N/3IIaKqL3LQPq7tIXiAxKwWzLJFnUhfJOGHdVvsGcsQrjqndHEBRWjiRJpnhaPrc/gX
         efMQFwK7jHkz7YHABUEmOGAaMNR/JaqfnnRNMDl0EdKLoLgABwlTVmuAqHDSmCW30Uzi
         3Ryw==
X-Forwarded-Encrypted: i=1; AL+hErEADOvD+L90pj8pN855+EDCi+thYjFCiN171xYjWIyzKSkG7dRdjXmuzX1fju1Bl/rOWWTtPVBCmx0lMTdIhXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZKmTaTkfy3iVBJl/9Ar1y1ssEM8cDHIGKWOj7c490uQuuf0LY
	kpYdee+dR2A5xlOtJ0SMEs0vndqXxVMF3TVE+HRDD7K7EBQucTeFMstY
X-Gm-Gg: AZFdTZesBLiWqVH5Ti/gIHAujuDLlgnrROOyDgfYeqiGiTcVK6G/fekXO7/T048/T1I
	6Jbkdlwp3OiKPKfo2tYCxtYtgaNL9sPErEpdRj/fxa7cGQeLhEBlssP+8fTE2E/Ysu3xD1szcmm
	68AsTYdB2K9A4MaZDUFhcN4fGDtmja1OnM82tbwAcpWCrUF8OHjON9sSMPRIW0yT+wmwKXf9yvY
	1lYzTOZl5i/gS27Xn1NbbigkS2cv2r6D6DmeZoYsxNdYTVGrDZm8H6yoxD2BsbXazSN8bNmbKdd
	hPzkLLJDVGwE+sd+teu/0x+RG43c89U8EQ7HwUbIhqBwyYg9chVRPLoE7Nv9anNhTt547wIMjro
	OdzOmMAe+lVavtRK5x7h+GesUVnLx3HJqM0Noqm8DqkWR7ivl2bh9qOyv6caV+y5tlw32VNKx1j
	lC7lbJIx04a3vtNy/Sk5R2F2HUnYsUa4g7fE8gX2tXa4TpuEmXT0dESMbztLlSf7AjM9nOBBZij
	32pWmKn9zN0eBpEoVvEMhX2u/P6W91cDhWlg26yAOB2ABVZSRoVwFCkMG0IqRMjnqSbnvjJ3Ggm
	mVTTRqjLJVRbbkWjfmjR5l96z+HUyjAfMJtAXxnkpXPtqBPmxIxS+oItswq4Pt7uFQFKfgdbnQX
	L8okyd7Qf6fzxPXxxED1mlH4TohtS7CLUJpQj4iB640+8c0tv9K4AgQJmTB8AhuEAJD/4RCXbGY
	sLCg==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr280133265e9.13.1795507667915;
        Tue, 24 Nov 2026 00:07:47 -0800 (PST)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-002-108-156.77.2.pool.telefonica.de. [77.2.108.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fec7sm24898020f8f.26.2026.11.24.00.07.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 00:07:47 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Fernand Sieber <sieberf@amazon.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Don <joshdon@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	nh-open-source@amazon.com,
	Fahad Mubeen <fmubeen@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Misha Karataiev <karataev@amazon.com>,
	Hendrik Borghorst <hborghor@amazon.de>,
	Ibrahim Elshahed <lshahed@amazon.de>
Subject: Re: [PATCH 4/5] sched/deadline: Don't charge core-sched forced idle to the DL servers
Date: Tue, 24 Nov 2026 09:07:37 +0100
Message-Id: <20261124080737.1988-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261112161548.78189-5-sieberf@amazon.com>
References: <20261112161548.78189-1-sieberf@amazon.com> <20261112161548.78189-5-sieberf@amazon.com>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 12 Nov 2026 18:15:47 +0200, Fernand Sieber wrote:
> +	/*
> +	 * Forced idle was not time available to any class on this rq, so
> +	 * don't let the deferred servers consume their runtime on it.
> +	 */
> +	if (forced_idle_rq(rq))
> +		return;

When forced idle ends because the sibling's cookied task blocks,
pick_next_task() clears core_forceidle_count before the idle CPU runs
update_curr_idle() in put_prev_task_idle().

forced_idle_rq(rq) sees 0 and charges the forced-idle time since
idle->se.exec_start to the server.

cs_dl_server_test passes because its FIFO child never blocks. 

With a 1000 Hz tick on tip/sched/core c47af8566706 in a 2-core, 2-thread KVM
guest, letting the FIFO task spin 800 us and sleep 10 us drops the CFS share
from 5.0% to 1.7%.

Thanks,
Karl
