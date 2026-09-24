Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABF349E5C7
	for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 16:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265651; cv=none; b=VOPObqUQTtNmZFkr54EluNqNd7n1Y7b3GUiarkZCmdMowtO+/jtFjnChSEHKNfM+PyrAfv0pzs1IRSexMYd7fEHMXudUoGOMoBNu9Y1EOGI9Vpm/umMdcn/6k1fHbkpTjGFnvKqLIDKpmF1RCxmyFykDppfoJkkYLPTkEwP/7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265651; c=relaxed/simple;
	bh=fWaHIyGdGkaL2exNAFTc0ka5FHQuCrvVozIJLfHuzxI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=eD1sEy8827gHzDrGO+PzjJLvT1QXZ+WHfIj5amIGLE60NWfOb2FHD7gXzF79cFjEj+pauT3aNH/39xrjz3yWd1sbjpkGH37WIdqH7oXeLaKQpTP4syx76ItIdYqt06zXD3K4XW9pIkhHMLu1Gshp2KsEqCk/CYoX5+b8B7DCG5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpEBHQWT; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpEBHQWT"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469d249c5so38431b3a.3
        for <linux-kselftest@vger.kernel.org>; Thu, 24 Sep 2026 09:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265649; x=1790870449; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w3k4RqeHFKIaWIEmDK7rN40hKKfbvnES8Mvv5gU8zUk=;
        b=TpEBHQWTTGwtcZgTsDkFS0gDRfpBP8QL+q6U+osoPMru26pfWjetPjdDja7VpjJ9iy
         VS7ZT68QdNvrkUTw4beKkVurefY7LoTqpM9e4AZivFflPOqoOq0svtIkA92G/XMacYzn
         uVRLsx4htlm1TOT52VBKbV4vZBUUnl8NwhDj5Icu8zMHoXeIUraCy7EQ4YXampIHIsPM
         kuyFqu/LABlYAWzKcwSrfJdBsfKx7Z4Mhbzaz/20Gci2diZ+wqQPl4J3RypapLMl7UOC
         B0OLPhj0w7g/2rZLu8Iy4rkth0Ka6RO8bfsI47cAg/qp2nMfSungBmdHfsx9QyKxV02D
         3njg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265649; x=1790870449;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w3k4RqeHFKIaWIEmDK7rN40hKKfbvnES8Mvv5gU8zUk=;
        b=f2PetWse0sKfHr1Om5HvvyJm0mME3iFTIRNnn4yX8bwE1KEDcf0XesWsY9QWTXNENY
         xoMiJ4vt+h+rz7miHJlUeUpHKmUwV8LgDTobzbVJdouuST4rSq7AMpe7VSRVGkyYUlKP
         iFQAaqsN6kMM+B8UqgEEz0JjkqOkwM8VxB8evsj5O8dkx+9U4kh/mXbecCXEA3sI8ncI
         ngjGw6ouJfWsfE5w9qkf4Yfa+kv1NLZzjpWvNpO6zDCO0FIo0dJUOmYrr1ENeuXOYVx7
         t8X2qJx/kdqHE9NgMjfeSFAFcXnFHljchUHmv/L7MRmS1i+fxgWx3dIMPPmzHXJVhGSv
         YJCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKlOVOszZ9uPVz0piZRY/MfRiLuA32DYHTfqO/ZBGGadwTTxzxRhI34cfH7jsYox7ITC6TEVk4viVytbqoJHY=@vger.kernel.org
X-Gm-Message-State: AFuF++lmhipI2euQ0qWg3geJ3MentHb8TDD5jllpKCabqnFylCImb4ER
	pxKb4QTdBI4Nl7j9FxvtqzOMS98Hs923vfQmDRTceqp5Or2+ZStsuVlh
X-Gm-Gg: AYBFou33pAejI5rd+sGqIxPtuid5SLeqeFRbh8g20jvuhdFdn+C0mv0VoFtZ7AlrOL3
	FQNMCxMSsHs8jL4yekZtFGO2IyVL2KD3c/yK7AV+2XZH/tcQvW9DFA1T1KHo3BQrfab7jCzjZPS
	Tl4Hli2y9PNsSTmWDJkgglK8fTW9gxpTiUxdk2hiAkl8sgRNd1PAi65MTIhN8cOztwEjn+2Z6U0
	5QqiwBIqUW67QAehRSdI4P1z2rHs7oNWJS9u8OZb+QqxiaxbdZngDrvumWA/I4Hf9WhfnQJ3kHM
	bbB5D2raggTzu18QnpVkS7l66I1SSPZsBLlglwsIOSqoefr18Vp1SSxOMT+7L/3uhCGqqXceM80
	BxxjKkCUGTsWuxDqPz1Mpcws2LYVwXKiVc+XWa2s9KwYIOiM0Ajb4fkwM1hJVOx6uUXYKebH3VB
	q7w9/vtr2ZQP0TGHWzrrr908WlNmL+NYJY7vNw0fYttYtpULFbxQmhBPdkwZImvtieYbmuaXIJ5
	nhMVBQ+wOUReYtrWKr1ZpOA3FlDUg+kkdCqUqwi7XFJ96A81Ou+gmSEM4kBkKLQI6LEOwoLuQLH
	ywo=
X-Received: by 2002:a05:6a20:3d82:b0:3d7:b90:acba with SMTP id adf61e73a8af0-3de0e703d77mr3010684637.6.1790265648783;
        Thu, 24 Sep 2026 09:00:48 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1cfbfd11sm3432227b3a.11.2026.09.24.09.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 09:00:48 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 16:00:47 +0000
Message-Id: <DLNO7GO4QMNE.23673O3BC9B7@gmail.com>
Cc: "Andrii Nakryiko" <andrii@kernel.org>, "Eduard Zingerman"
 <eddyz87@gmail.com>, "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan"
 <shuah@kernel.org>
Subject: Re: [PATCH v3 bpf-next] selftests/bpf: Replace %pK output with 0
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>,
 <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
In-Reply-To: <20260924153153.tlErkAb5@linutronix.de>
References: <20260924153153.tlErkAb5@linutronix.de>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, Sep 24, 2026 at 05:31 PM Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> v2…v3: https://lore.kernel.org/all/20260918102610.gxA3km8_@linutronix.de/
>   - correct the subject line
>   - correct grammar error in the commit description
>   - Pickup a reviewed-by tag from Emil which was sent for v1

v2 was applied to bpf-next two days ago.
See commit 79dc258c9392 ("selftests/bpf: Replace %pK output with 0").
The code in v3 is the same. Nothing to apply.
