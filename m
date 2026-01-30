Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78D302742
	for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769804188; cv=pass; b=J44aYXUuy2PoEtqyA/fKIgp0MeeSMI8UDM9X8vMWr8KhfGFyrva+Y0rLb0mTKv5gV1lNUVCQRBwvWfslbcHk1kUqiaueHpkVFNwE91cU4mRFiaNnuiShgaS9MGkqjfB+3JYaBa5EMKZQoXGecuS0l/N7kyyna5kfXdpeDAYVpR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769804188; c=relaxed/simple;
	bh=0t0nq4izqsf4GvgNU/9Cuo4KWBgcrjRZN6raZ3fmXTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rfXVYT3JyW6cTgbmEzR5zQCev/rmw1/PnASseMLelYJYWN00/2WKDp3fAhNHf8lhfBAaL3lvn49gW0rcJI80dgkwdzSGQbPdHZL8LIQuOq6zVX+9oNAe+Y0kcU6cMvAErKDwu2dzE4oxTqoT0EK+HdhmAAtJrxEAasI2rdsj4LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4lqHbcKb; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4lqHbcKb"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5032e15525aso24904801cf.3
        for <linux-kselftest@vger.kernel.org>; Fri, 30 Jan 2026 12:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769804184; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQeiJuQNa+hwyXpc1XItktnGViZQOyX7PJJGOT09SpS5CKHfHWaAxFpI1TtHjmGCQD
         MdVRjzbT58/9LCISM8m7kjfSJEi4AySPeP2CQtZyOgVb27WNQrJhFAQznCXyN5WIJv7s
         CId80LO2HfRbUw6WV75gx5pb40FCEoKLlU6z45OTzCa1prmcH0xHoPGSZfSDM6IYMsVj
         ejw/oyM+1pn7U7yK6F6QsU6d+G3VqiHFC6kWGCl9Lu5vyhDDKwysynY0H0NsNpRkWVbT
         Qnff8jWC+hx6tdcIIVJtENK+cI3nTOl8K0f2HT94uh978dqbMEkSoH5dmjL5SKlbVcJv
         u6PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0t0nq4izqsf4GvgNU/9Cuo4KWBgcrjRZN6raZ3fmXTQ=;
        fh=xBLwJ3T7ClL7MoaYiknDoKMcJRtTzLY0l1a7Hx+n/7w=;
        b=a/4ot5vl/4LgyXLd3181dgNyWwL4ch/aA91fCajY7BJ0GSfAVHvaY+8e2/n0PuQTg2
         7ebWr3nHcb+WSrj1bUwzs341tBv7/3mrhRiNlP8Snm4I/c4IdgeILGDsbnNhUeGb+I09
         f6iAdShJblPQAp4buzqLqdlht8QvQMsm35OFUEQbeYOs2QtUX1jkfyD4PQ83x4cwCXsj
         CtquMOlxIs8GPwZpwI04sMoERrV6FwFXnwUpJzEyuH/LrumWORd03xp0QOJyk+KdL2R5
         Eg51Xd3KqV9fqk12bbZ4ktkL1I+pApQnqKx6xQimf1rNnYHoriM3QW2cCKAt12bMfgZa
         4vzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769804184; x=1770408984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0t0nq4izqsf4GvgNU/9Cuo4KWBgcrjRZN6raZ3fmXTQ=;
        b=4lqHbcKbgZlZxkknGGzhVYdd0cB0Qo4JkWziQ2GF6V/pzfRx015B1rrneZkZc43XYP
         PlhRqF5BIW5AexhZ8dAaKSmCahB1eXWa4bXx5lWt15xTCmKq5Zl52xlBHTGYRpwMAzd9
         xvu1WcqzIeisOaeyaVCcQMqbEZXCj/af5flh+LP9/OeoNI2N2SAOplCJoO2S827fU0Jq
         lUlBQanFLuMZsD6GpjTfiO/MUlaELr+mzJIVKEtuPXEpb1Vq+dzOeE/hwCGmLnP5AmL2
         Q6+cweBqbKcqYJ+PyzJlfu2Z8QfNoGLA3zrrjSi0GC5gVaJrHwccSgGH+d77yLvs5OIn
         s6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769804184; x=1770408984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0t0nq4izqsf4GvgNU/9Cuo4KWBgcrjRZN6raZ3fmXTQ=;
        b=vhZ0u5Xx43YvyDv1+MY91/95pJvV7FIazclnd/+T6Xasm+cF+kKJRkiAK6LeOKiVF3
         pyOa0AsfYk2Z5PRyt7vBZZAolv/VuPvBNMt7y7QsAnyYu3EWoT8n2dRQRkjnQG06blZn
         oYP3zaZbiEhip4rcdETbNP4/fyI42rp3d47J/O2wuXff61E9h96/1MMQ+brN1b4VlNaW
         8LEVx1WNrspoSOc9Sjk5CdbrR1qpRIhiypKdQbjcO5TgLWIJYy5gusd8Gzp50ymsWXj3
         10YL232zsnedvLrMvOf29EffOKycRemR06HogaGU8QBkWiPHgoQvN+8OgCTXlcGN//t9
         VqDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZNfqmaDpzhuG3UzKGHejxWDoMXxgnHS3O/8ZqpoGK5AbaPgodbdgHaA9jnfggQydhfJEfHEFp9dvkbNVU2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0vkPyy7glrWrBfjZpnmQ+57/Gpp0WbenrG/5EHIcM/Ue7PFCw
	lpNVD9qmOnHRDtq6Y2fNr7YUNoWRLrImdL41E0Y7g0K2DKXooR15XYW7JJf5ljaJzf70kAz5y48
	uzlVxmi14xd/gZKDsk1s46ONBgcJPL78E32KGztU+
X-Gm-Gg: AZuq6aK6O7Qxuyg3wfohUK67tjOcyLfb1Bg4b9JXiTaGokvHPRf1SCfmtpLlpFEITAr
	yRjOM67NBJzm+SdoODEhMSsGXHEpOIrvtFib6auQzH5zn8wwraTSzV0Ashhcj6JttRnJ8hkyyDq
	zaBoAdfQUtpcFdGGcgFaxm+x1ggyyJBKO0k8S4+ROJ13pH7UHd+hpAU26T+gWpxN7Rdv/WQRxhe
	KoSEyWN4robYkbvP+RWhlMS7sHsIBd1l5GywV6St8AmLto+RijPTAQGvvyzskNH3QPt+Xw=
X-Received: by 2002:ac8:5754:0:b0:501:4420:62d1 with SMTP id
 d75a77b69052e-505d226f589mr60062871cf.48.1769804182889; Fri, 30 Jan 2026
 12:16:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-net-next-mptcp-splice-v2-0-31332ba70d7f@kernel.org> <20260130-net-next-mptcp-splice-v2-1-31332ba70d7f@kernel.org>
In-Reply-To: <20260130-net-next-mptcp-splice-v2-1-31332ba70d7f@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 30 Jan 2026 21:16:11 +0100
X-Gm-Features: AZwV_QhPfbD3TZKlMJ_xVQRsXqSJjU6kBe-oa26mxAqnC8KtZaJD8P46JjJ950c
Message-ID: <CANn89iJtTCAj7h2gsAGsu0J5E7KNXtqCgNR5Cp0rJB6ifnMvHQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/6] mptcp: add eat_recv_skb helper
To: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Cc: Mat Martineau <martineau@kernel.org>, Geliang Tang <geliang@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, mptcp@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 8:24=E2=80=AFPM Matthieu Baerts (NGI0)
<matttbe@kernel.org> wrote:
>
> From: Geliang Tang <tanggeliang@kylinos.cn>
>
> This patch extracts the free skb related code in __mptcp_recvmsg_mskq()
> into a new helper mptcp_eat_recv_skb().
>
> This new helper will be used in the next patch.
>
> Signed-off-by: Geliang Tang <tanggeliang@kylinos.cn>
> Reviewed-by: Mat Martineau <martineau@kernel.org>
> Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>

Reviewed-by: Eric Dumazet <edumazet@google.com>
