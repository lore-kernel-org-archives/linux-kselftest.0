Received: from mail-ej2-f31.google.com (mail-ej2-f31.google.com [74.125.228.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB6259B695
	for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655992; cv=none; b=DzTEomR8lh94jVIgbsVhRQIBVeIpEKgwjxueJUgNNAwKTGBbE0muIyIg/V28WtqSCsg+VstA2+jezq5OCiQLmcaadKy4XSqtR+4a99xqrFfHUaJg6spcsQLE3lWrBUcDoVqdTQ4od6Z2W7selWXXIuUCokT+7vFh8jYJOVdOPTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655992; c=relaxed/simple;
	bh=ypS+0W1JTkbNyjduQvRz5CNjg+2J9njr9YBCbuNjZKM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=Rkjb1KDLJGne/hZI6x4RDPEjpAit9VLy6xJtOcMD7tmnx7Sd2wH2XSQiSzVqjhntp9wNLyPpBCcZtlsZwAXJfs6G1BbHZpG9MJkdwbsOp1C2pu2f73sEDxxLC1GHJi1glvldmnstG6Eaw4fdaEE7RPs8+93Z008Le4zf2pfjdug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNjTvLJB; arc=none smtp.client-ip=74.125.228.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNjTvLJB"
Received: by mail-ej2-f31.google.com with SMTP id a640c23a62f3a-c29703cb796so143348866b.2
        for <linux-kselftest@vger.kernel.org>; Thu, 17 Sep 2026 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789655977; x=1790260777; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ypS+0W1JTkbNyjduQvRz5CNjg+2J9njr9YBCbuNjZKM=;
        b=NNjTvLJBMBhPIfXYKjyssqB0qPFs8d7YYTqVQtZcRnyhOL4jqg0IkM/zt3VVubhFGl
         x5eptrqYQhDblFRKdxpoFGXgAsJ4pYtNrt5VFRHc6C0ZZ9Wq0fbdHAxi2+2ifmodM0eq
         zlMFlIrP/d5TX6wUbAhEZ7xg9H9DxYMEe/zzOKjQfdS6C3wURZ5RtMGllGoIx/2fh5Uk
         Sq8Z7tkncPnWXbiWYF09odhjL2wyENXuEsJLgbWX9tDhxiF3PS84Mhh15ugq2CgqTnXO
         Faagn+0Y7wXn6nxTa4hRp7h8zmmWN/RuGmmrLEjhhfz0OF4J/gQoJw/0fk8IVYoAQ8PS
         OO2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655977; x=1790260777;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypS+0W1JTkbNyjduQvRz5CNjg+2J9njr9YBCbuNjZKM=;
        b=OuSGGEULTl58sZAEoa7g8sT/0qIrLF3KNyD/lBW3VkJqEJLXMftSDmfh/hlG/M5JO7
         X16I6zjmUvIZxIT8KwKLvPXde0ec/1Gymb9cdCLOqufZzBC54WQ0tzNJzlhzV8D03mPL
         U2Hdj0qy4aqPMGg1sv1bRxuyLQ4BNuB2Cikv2HB+hqqYFuHsXQk240lSCGvINbqf8yt+
         ec1frUcV5gqFI/YUbcvI7uK0J+2SnKnm2t6xoHx0yr5pD/7KlvDEU3c+TEzfB5IGrjEl
         p94qm6edpx4khVjOAyG5V2l2Gr408/Q3t8hmuHhVNCelc45AD8Ego8FXAxqzFrDlqa7e
         yCQQ==
X-Forwarded-Encrypted: i=1; AKwUvByvjSFHYPzRPf1T1OxHcFDMfZ7VAtZuryFuysEg6jDmtVcd8FGLw+IIpVP47bTJm3PuwFuwirF902wDiVyG1Zs=@vger.kernel.org
X-Gm-Message-State: AFuF++k+Nm75kiLh/aD6Uns511yGmG23LqAB2pTBo4PLsJA8c0u/h4N2
	TN267KDHW27BrA7b9Iy6mqO0VDUwcx3tGiLgs8j1++MJ09iVIrQhMJnw
X-Gm-Gg: AYBFou39+mxb4CuFsCzgDT4YYznaxDGC60n1jcbQ0aRDs7vV5bK/IeT2pegqGxTYGbO
	hqn3MIDVAnQpnCXYmSftwKUNvNiEQiv+RuUGQS/Etp/acNeclFw8TYa6f2bOhrC+VVP4guL+Eoo
	X1xsMH5F5vMOU1ZXjr0DBwQgT9biBWFZU6DAGXG6kvrA8pGoLOZPs1TC7xSdX/uIdm1VyHreNge
	ZyxZe9eyxMUcy2IwBtvQz0GSJb7qMayqp7FCAYbBrLZVfvjW67T/dMbjvO4tNJzzIwAljY/F31W
	ynMae7DBR97M/iKMWIW/41handRdxD8GD7fFjs9kW7QSz87AjO8TKBU2CmsGyc7mYj3bYIYDI6F
	iz5xLvZ9d7Xc9/n2LxsKHTqs9mkpyErR6zdvx9J6UW9mq8iaVHEyEvwH5Kfb4zDLZllDIFTAHCt
	AbG6x/1B2K+Mz7Azvt3rb6OlUT5esRPaJ3rFbif/poifYyin8RmEM5/VYLrF/hHSep1vsC8SiZU
	6hnFJNYM0PZz/3SC1KiAoI8ZAC0TtPZEBwCo26eDfA0qDfg9VFbYvaOnSzqFm2QqlVbPvTa8IZ4
	XZUX
X-Received: by 2002:a17:907:9720:b0:c29:5215:b2d2 with SMTP id a640c23a62f3a-c29e52cddedmr517557966b.23.1789655977192;
        Thu, 17 Sep 2026 07:39:37 -0700 (PDT)
Received: from localhost ([153.61.198.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0898bdsm306916866b.5.2026.09.17.07.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 07:39:36 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 14:39:31 +0000
Message-Id: <DLHO3FH8LYMR.33VPRQKV0T0TU@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Yun Lu" <luyun_611@163.com>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <ihor.solodrai@linux.dev>, <daniel@iogearbox.net>, <memxor@gmail.com>,
 <martin.lau@linux.dev>, <song@kernel.org>, <yonghong.song@linux.dev>,
 <jolsa@kernel.org>, <emil@etsalapatis.com>, <shuah@kernel.org>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf 1/2] selftests/bpf: Fix timing-dependent assertions
 in task work stress test
In-Reply-To: <20260917080839.462038-2-luyun_611@163.com>
References: <20260917080839.462038-1-luyun_611@163.com> <20260917080839.462038-2-luyun_611@163.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 17, 2026 at 04:08 PM Yun Lu <luyun_611@163.com> wrote:
> From: Yun Lu <luyun@kylinos.cn>
>
> task_work_run() assumes every stress run observes both scheduler
> contention and, when the delete thread is enabled, cancellation of at
> least one pending callback.
>
> Neither outcome is guaranteed. Contention is observed only when another
> scheduler selects the same one of 128 map values while its task work is
> outstanding. A valid run can therefore have no scheduling errors. This
> was reproduced with a single scheduler: more than one million callbacks
> were scheduled and completed while schedule_error remained zero.

So it was "reproduced" by changing nthreads from 16 to 1 ?
That's not a fix. With 16 threads hammering 128 entries for a second
schedule_error > 0 and callback_success < callback_scheduled are the
point of the test. They check that the -EBUSY path in
bpf_task_work_acquire_ctx() and the cancel path in
bpf_task_work_cancel_and_free() were actual
ly exercised. Without them
the stress test only checks that nothing crashed.
If the unmodified test fails somewhere, show the log.

Patch 2 is fine on its own. Send it alone against bpf-next.

pw-bot: cr
