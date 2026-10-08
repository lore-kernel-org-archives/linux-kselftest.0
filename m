Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B415D3D1A98
	for <linux-kselftest@vger.kernel.org>; Thu,  8 Oct 2026 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494427; cv=none; b=LeQVb7pDZBthzIDaczqdwhTz/1s9gYn7w5OIu/djlsu2cVzvDsLeUYw15yDgK8dR4e6Ovo/BHQbTsKJJlaGk4j+oOfRnPot9g/6L9OMjvYma7q7X0pJfDnmSz0GF3IL2sEY0r/s2qOivng7mPFnO0s5DkMX2P3MFAzxqTMW7v1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494427; c=relaxed/simple;
	bh=ZmRkpa96nlrJCixWgwASI4DUbhP3Ms77eFQ2CQkARmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uEUZOrH2YpuT1ErnhriI+CjJs+xKh6Cms2GG63PlrPgOlwomQQh8b3rLmkrq0M4dGZo19hNTXiN9uie0dr6WhMgebC//dVWuwe0vhD7fO1nAxUXRU4JVyq8XK/+NLGxGj2c37F5IuxQsUj81GtEDkcPh1ZPnYOLgX3ru6r/3JJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=RPu3hBrW; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="RPu3hBrW"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8256106635eso1771447a34.0
        for <linux-kselftest@vger.kernel.org>; Thu, 08 Oct 2026 14:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791494424; x=1792099224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EcuCJfZ9Fs3HAtWAzguUXStL6q8t6MptiYwiyeKGOkM=;
        b=RPu3hBrW407ubjSyb8jNZk609/4L1kJdimyhfh6WWwIpX/G5nhjtZbq0213qdU5qVu
         v3hdJN38E7B1rR0VVIBVoY5Qao6ii75ApKGxQ6bebVl9iBOqsOXOxHdopZbxjeTWVAZq
         xaoIMkMboQFXmhlhSijjNvgdfcE+sBnjsCMb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791494424; x=1792099224;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcuCJfZ9Fs3HAtWAzguUXStL6q8t6MptiYwiyeKGOkM=;
        b=MyWJjdW7/U2W9iG5AoIJxn453rZPIQqaZ6Z/dxEPjBXIgFy646k6ngMwe51P1TSBEO
         U8QOYrHI7rQy9XdGhsjbiuHxFc1cz7eLcKk4Yy6b6VBjqQwKSAV4PQV/7dm2aY4kVOB9
         Joz+oxLljEBMiSYI380wx9EE34y61EDIkcOEW3Q82gFagClYsfe56Hb3MtB3YzwkdAlU
         Hwg4s+FIzw5OVFecW46oPBZyyajKjqojyKGRcPS9uVg3iDWc/MiQ/6ZYO0G7lyWfNLEj
         WInGP0IrSJ1ixRUshNDbyB6xLt9BBeVM1oSKZ2U6ceirkw1dhXcMGPK2rBN/c51mR6dC
         tb6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxCGv1cLCdA32+snjERVjuiiyKgRqLyxtes16bq5iROawHfjVQ07CloGByPcLwK9kRb4Ygdl+1565bAboYytwM=@vger.kernel.org
X-Gm-Message-State: AFuF++kFED2aXwE83QcdXWS+XRaG7tDuE25hPCuR4rZbXL0e15ZTPdS2
	ORtUsUrPyJHYrugKV4A/NhFIF/0vF+siVlojwzayh5snnMtAlMzw79RPZpcizaX4X0o=
X-Gm-Gg: AYBFou2LuJAdE2w0kWZbp3XCsK/KewSYPG2NlYQLAmezMeZ7akxhET6lVk68SmN6U28
	H+jMCVcyUTrjf6wpLKlSKRwStyXzkVVRoQ3sYVL51zg125vvgHKJ/N7LSUUR+GZDN8mMXlKqKSG
	2z3xdmWb95BsgeA/JvvEVJbstQ64iS1SPrfIOFv6aDwaCa9Lv6BN2jbQzh/uHGZmlAfO6DI8VHw
	W1Pp/zjHP8xkqxu/nk4RycO4yBDEEsHVIhPf7jkKP5vdfVdiZhPNJRbJjXrHqqsV+KVftY3rcLI
	6MEdtEQDHUTfQtmCSaGtMFCZmHAA+QcOV0T5TSqxbaBNH4V3NOlpEgIoQhzhl+T5gf4Dcrq/Dvt
	oXjXR9+u9nep+xle5kZS+qeLF1i0Asokj19TbFs9Mcn6xpGQoxUst5iS6vZq5g67L5ezE/BOK7J
	4v4mXJ+7PlRkrqWB8PHRbHp8X+wE238ODD3DPrpG24iAGCjEx+Gs2WvtP7Y/Pdbacmm1b5Ux1fa
	jdRIgQ6eRn9YQtCqKOc2ME5GmD+5dtiQB4vRbAAJiobJf0AAL3K0sa7EQAg2zPIRtbd/hFmbdub
	wxAZpgUxQYEbmw==
X-Received: by 2002:a05:6830:6a14:b0:823:25c3:30a0 with SMTP id 46e09a7af769-82acfbb6d47mr8023946a34.18.1791494424614;
        Thu, 08 Oct 2026 14:20:24 -0700 (PDT)
Received: from com-68297.corp.openai.org ([199.47.143.0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8303a328dccsm117624a34.22.2026.10.08.14.20.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 14:20:24 -0700 (PDT)
From: nramaswamy@openai.com
To: Neal Cardwell <ncardwell.sw@gmail.com>
Cc: Neil Ramaswamy <nramaswamy@openai.com>,
	edumazet@kernel.org,
	davem@davemloft.net,
	horms@kernel.org,
	jiayuan.chen@linux.dev,
	kuba@kernel.org,
	kuniyu@google.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ncardwell@google.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	ycheng@google.com
Subject: Re: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing loss
Date: Thu,  8 Oct 2026 14:20:01 -0700
Message-ID: <20261008212007.11619-1-nramaswamy@openai.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006141300.1722466-1-ncardwell.sw@gmail.com>
References: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com> <20261006141300.1722466-1-ncardwell.sw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Neil Ramaswamy <nramaswamy@openai.com>

Hi Neal and Eric,

Thanks for the detailed replies. Neal's approach is much cheaper than my
original patch on a few UML microbenchmarks that I ran.

I'm not entirely sure I understand Eric's usage of "often" when he mentioned
the O(1) list splice, but the metrics that I've collected from my particular
repro seem to suggest that Neal and Yuchung's assumption about LOST but not 
EVER_RETRANS segments holds in the cases I captured, so I'd be happy with that
approach.

(One super nit on the runtime complexity of it: in the comment for
tcp_tsorted_relink_skb we say that it's O(1) amortized time, but I think it's
more that during partial undo all relink calls together traverse the RACK list
at most once.)

For Neal's fix, I also did write up a small packetdrill that shows that segments
that are already retransmitted and then marked LOST are not added back to the
RACK list during partial undo, as intended. Happy to contribute that if useful
for explicitly documenting that this is behavior we are okay with.

How would you like to move forward here? Do you want me to fold this into a v3
patch with attribution tags or do you want to send a new patch yourself?

Neil
