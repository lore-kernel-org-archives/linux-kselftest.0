Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605903002DD
	for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 08:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779523546; cv=none; b=k1ppQR6fdXKvGtFeA3YvRRyfnrZMkHKOq41WUH6G8JLdaIWZqREJbhZxj0Qru4ejdqI59n//Izakf9/V1WGh71rzU2qp6YOEsWUUfyj1m4lzN60XDT7eIQqWwcs8JtKotBvVZAaQTGKot+VYdPPp+k+yf6Y2RP7RfeF+Qn/5ElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779523546; c=relaxed/simple;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQ8M4w+LLmiCYpxiXf/peYsTl5i5BtOqI1I9Yf3t1Qk9nzp4Wdkzz+hrgifsFOs9LQwAw8msbQ8Q7Fu4i1eSK74V04Hf1jzLjqWPJ+frBfKB8iE6z2SWeFrIejFHP32XWVYgKzjzj8c92CRegI0Fzb1XtlwwK7xRnEQgrEoPHqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cAi0Z1yz; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iuFKCKXQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cAi0Z1yz";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuFKCKXQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779523544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
	b=cAi0Z1yzLXhDQAP6o8Qyut9ThhcXXM593qJ/byx1MMoACS6iILqskdPgcodrT75Otml6mv
	4bwKk3Z4/daOJX8RQDHk0lADbrVUXxaG41UN+ANPnDMijMBNKLcbCXcMD38UYMRXhhXLoK
	yoLZ0NcaVLdTJcGjQ4uEERBBmpOo9yo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-PK4lVntMMOGCs0INXt4xNA-1; Sat, 23 May 2026 04:05:42 -0400
X-MC-Unique: PK4lVntMMOGCs0INXt4xNA-1
X-Mimecast-MFC-AGG-ID: PK4lVntMMOGCs0INXt4xNA_1779523541
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-bd09ec46507so183311866b.0
        for <linux-kselftest@vger.kernel.org>; Sat, 23 May 2026 01:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779523541; x=1780128341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=iuFKCKXQIJMGxcRkoR4rCrXaIqevkqf5au0Bw90ZmbQggC58BU0y8g8qtoE6gA3AUI
         esvSUsL3T0iQIWWawN++DqASPKLm/KNi3URLFEbyv6U0p3UqX2aYqIypn+UPjbTv2e5E
         xaLRQ7cZ37eAVIaCNaZ/9QTNEkh3Vo6CfW/6iTlHxbgEpVJ9R490dJ2evesGY2hYscmI
         NF72ATboAhBMyB50LAnIulYEnFitiF1cO8h7BaTA5oXjOtAK5jDcjnOggLajDHzOgDui
         dUMUSpwbsvtWZTJVxWZrrtFZtIP3IdDEoT5p66cA/Qe2E+yGkHKEiLt/wqms4r0mGFhO
         YnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779523541; x=1780128341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyh9GNwkSeiWX8VVWJet6cmrStrv1Y1BhHYKMAKCy08=;
        b=nxH7TYYcHftTIZClRzxRlOgvoFV7/7A9G61jsiBqCVzBMogGql9OcMQ5jWqbKchnIR
         IDTaHoLY35dGZWNifibztLha3RcCZi86OILYep4LMClueyheU43VN1c/tpC8vG77+srn
         MfZfEj0qTAYHEPeOCz1REOq1qyUjP031KVQD85ekDdP6To4dybxZZj94ILdUOlInQOm7
         2XRskij31daGTcsLVXt7FRTxvt2QeLJpRAio1U7Jjlwj3npoYvV2X9Qoo3quMOFDQ+x0
         Fs1SYfkz8p2gQOwt94SAtFL18rMKRsimJYIdXM716Krp047fH4ht+76D0Ve5VSRBrVHk
         wWbg==
X-Forwarded-Encrypted: i=1; AFNElJ/XzbzPhuYUGhU6CO97hqq6H0OQs301GU00vEwzwtxllJVLiZR5b/tuQwikd5ISsoVpOAretWxt+cndfE5LiUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4i7+HMlsjLdRxnvP4Ob3pAr/ofgtZCGG3MQqoMhGX/nurY2hl
	B8GkHsj3v+BTFcp3uDVpiNLrz4nBrkXmhtPZRTXROi3aFEZiwUdevAgFLVV0LnoBy5YPtnq2jRB
	yo+puutcMw7vdjkwxwxqiExPtJ5UteouRwBY6SaDN/0CzusXpYGwY9kB6HluXaRIJLQ7SRz+bxf
	c7ybKN
X-Gm-Gg: Acq92OE79YMe+ZthEPVU0owmjttSRihyGke0Idam60XHtYK6OiN5zJUJMFAMspVHiGr
	jXAOAQ84D9ZOpynAxxvwoOoKTkCJ0mByfUCWUl/cLDyjaKTmq/Vk6/vpTvprpRC9XdHHs/h11jd
	+ejH4HKNByKt5PsVLFXb68rc5DBdyEyWL/WnKYTJjmeRHW4xxYghu0ZWXwxp12W71w2gIM4E/RX
	/6OdKveXdWXrFkv5Hrossva+DBG1Pm0R4SFlguzXghCUSvucSTl2c7D4bHQ2oEWyne8Wl9UWxJH
	h7zrlOoW2PM3rcua5esBHUPbV3gaq1weHj11L+Zb4mB+YLVDj6+QAdhTY867IjRQiza+7WJ6AUQ
	fJ+V5kYnhhsF493UTHEgBYihaK3RoEV1fC2cqv/Fl+2nMYF7YnUriHOjQaNWP0L4dWPzshchR8N
	qkxgtqXzkIjGgnfyIApXoitElHkw==
X-Received: by 2002:a17:907:a789:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bdd272cfb68mr441494966b.35.1779523540767;
        Sat, 23 May 2026 01:05:40 -0700 (PDT)
X-Received: by 2002:a17:907:a789:b0:bd2:bd3:1ef8 with SMTP id a640c23a62f3a-bdd272cfb68mr441493266b.35.1779523540381;
        Sat, 23 May 2026 01:05:40 -0700 (PDT)
Received: from [172.101.1.88] ([185.48.102.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb13312fsm1606544a12.22.2026.05.23.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:05:39 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Hisam Mehboob <hisamshar@gmail.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: selftests: elf: Include <endian.h> instead of <bits/endian.h>
Date: Sat, 23 May 2026 10:05:35 +0200
Message-ID: <20260523080535.154440-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260409164020.1575176-4-hisamshar@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Queued, thanks.

Paolo

