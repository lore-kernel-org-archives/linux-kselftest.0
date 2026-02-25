Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05F2BEC52
	for <linux-kselftest@vger.kernel.org>; Wed, 25 Feb 2026 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772000986; cv=pass; b=b4m5DZTnRvahPtxcpvIZdi3jZZ6VHa1u1PkVaqDfgTkNjaJ3aImJ1Y6alY4NUMaC2l2OxcwCJB1tvBHc9b2b2PLWCWMjdLNAWN6HXvYgV6REo3HS2V5GyGTWE4YbgQEh5vOhCB5DHOwZ1au9JiVLReRTPJz3jqJwpSPWlq5a0e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772000986; c=relaxed/simple;
	bh=1H7ASAjpXSVpzxeNA58qJZFYrDFjKuuqkVSdPHj5ugw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZVxiNT6yCBDRo/rPXaZ2Mqa3QbX5HVvmqIprzCEcbhdP5YxPT6lav//eaZu0TGVROG5qzt4qPVJFdjeq+FL7jXNYHW6H+/eSR+e6mXSB705fETJwFsJZQkb8cG5/WAzTS+GLIzMCvZ2u++sK6j/ldscBKtjzxoOmjBq6SAdCA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=r8mV8kiu; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="r8mV8kiu"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdbdbc6b46so300588eec.0
        for <linux-kselftest@vger.kernel.org>; Tue, 24 Feb 2026 22:29:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772000985; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5SS7UxpcLYfoFpnyulElFIc3odd3teEe5Y1ruIjVp9R36Z7Q1Y3diQIzENIoGudTV
         V5LQ1lJuW4Vco02VYtEvuRnqyEeSHcp5vYau7e6f5snXTDCPuJAcLAd8AwUvu1nkVL8I
         SPJMOjCnVTRlhM4ZeCQrF2V/NCLhE37bYuZ+H4n9OZagewqJcIMJE/VXN1gTEHDBP2bg
         WM46mC3ooM0icqSXnVDnvShchpug/R0Paky4he9Nk5PVK5HOL7dxkkxcB4FPF5rXoM8j
         RId9XOK/C5F42MilU1LbBoo3ab5IbuyGPVNQkA+yqn9DmypQTIAoki9/rhHRkJVjq2C0
         kTww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1H7ASAjpXSVpzxeNA58qJZFYrDFjKuuqkVSdPHj5ugw=;
        fh=YmJgepGPs0BXo+Cjr0YCz/SsDIHRBSLpup6Gxr/yOxY=;
        b=VKEs9V/LnWQaNUBPf99vy7XTJc/BgBh/NgAcaLndxzqjdKU5pF9ToEYfRBxMFCgfPH
         o2bHZW9Hrfk+h4Pqu88Ft9+FEGF2+ntZ4kjcO0HLXH3tdN02YZ7ERnheDcM2NgXefhaV
         aBhxDxohF/mZ7hjjRSP5Xnp7mzWD91VL+b8Ti45tVR6JenhYt4L6/gWqGpWQ8kAT9xJz
         fWdkc1fXYz8lYDZkUasXMTprT/X33z+FHSkmzK0/DCB75JNWmqU4W21Gs5vV0R0D3HgV
         uobZRqWPn+mOQj2yOaedHmaOhLHIu2+NsMGP9YvPlb3Zi9Q1aEEjqRqoYNTrHVF0nKA4
         9EvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772000985; x=1772605785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1H7ASAjpXSVpzxeNA58qJZFYrDFjKuuqkVSdPHj5ugw=;
        b=r8mV8kiuczfO/B9vtIAeYNPNvsUP1ko3nihJsUafJPo6lsM+BtgaZ4Q9fRc4GXsQsB
         6PzB2X91CQiTdQvo0lrYJlQaF+QC2dlUlSLv7e7q9YZyFWgWLIdpljvC7b7JRRqxHViH
         ioqaqsLMHNq7iAZs6FaH6Hbhoqgw8eTHipAJvn0QMQxktpToHCMQOgcWb9prRknpiHbW
         MaJEiC0oDKFrIzzTkno0uNoUPWM88urbxHLRwyfzIsh6m7zrdl0AVZ0ndHjfB08Vs87Q
         bj/hJ30vg41FpZOagpiatWCcGpIPjg7Pw7UsR8zPuVG65b5nCtM55c8IwrzT4PLYZ3j4
         Ppew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772000985; x=1772605785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1H7ASAjpXSVpzxeNA58qJZFYrDFjKuuqkVSdPHj5ugw=;
        b=YTDQsJ0/QFAtMpbB+SZbjiNUoxbiF+xgjvszBHIILml9WwYaVGJyIReOUrazQEcvw6
         8zd0g40p8bWVSJfaXUn/vpvUm9vp/OAg6iRMod5TKLicgye07XhP2dWnO9842V9O1PYN
         IBXoBXby0s3q3p7otUCRAFSL19o/MJYnH8f6xT7toDrUPw098j0lxVZ4wEweYZNr8DkK
         kWE7XsbKIY5kg6uBjKNJaUGoN0Za8n1mQuBOhJKMIrylY55py+F74BhKysf7JXvfgyYg
         oeFxwabHKt/CU0d3VlSmPfzyguFt4mvvdaC+YUWkyESiu6MHWUK8tx6Hg1B8UO+aCGoX
         8xMw==
X-Forwarded-Encrypted: i=1; AJvYcCUgHbcmxVPDzNE2j2an8adOUMiHafOE1QkHN7/tLd2Ci12w5+uV40Nf7Y7dNsBuySDKYdI1GUtOe/JGF0LQXww=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnt+amt+CRmCYjB9+HbELXAiOwQ9JEGCgSCQj5atyNG5zVYJgw
	pw0pqTjf5ShddDhszC2rVUGIDKqWLitFyl70Dxn3G07umRhj1f09xXIqWfMlsdtF/tvvHnoeUWG
	iVN4m50Bt2XpTc8D2uRr4DNZA9kg3kMhLtcPiURcg
X-Gm-Gg: ATEYQzwqlHBgaxYQzfnGLeBmUtrt3Ga0uvclkyuyVIOB+7qABlLHdBiy90Ui5FzeFNX
	dXEJ3z+AAGUDOKIwCi9yArKg9dE7xazLmB/dN9WKzkahjeKcSKU772nNuOm3jeYxyWOzSW9Wewn
	+rngJbexJO+O8EjrQ/ydaLMT8jIWF12Yaf0i8NxWOmBndp7Inr/gA1Xum2AoglX9MBpGOvVAoVp
	iiXz7BNy966DtwjjEKGvtYcKZq5LjlhzpB0ry8iuDQHZxvD/de98E09DDhcf6+djx3RONJitVvC
	rXVfTh7SQ3FK1xqNWxq0sma1s2Jwbe6fpNDzQ65BzvtdNF1zcFJbFkQg8dsrAenMuo3xyNsf
X-Received: by 2002:a05:7300:ed0a:b0:2bd:ab6e:5d3c with SMTP id
 5a478bee46e88-2bdbc508971mr901962eec.12.1772000984188; Tue, 24 Feb 2026
 22:29:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224-fix_zero_wnd_fin-v2-0-a16677ea7cea@gmail.com> <20260224-fix_zero_wnd_fin-v2-1-a16677ea7cea@gmail.com>
In-Reply-To: <20260224-fix_zero_wnd_fin-v2-1-a16677ea7cea@gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 24 Feb 2026 22:29:33 -0800
X-Gm-Features: AaiRm50BS8IRmaByvMXoPdLT4KNzqIZ4frqt43YdVqbn5w-X7rkkO6gZU6lK_6U
Message-ID: <CAAVpQUC-7hWiefYDsubJTMJP0hAc1pYFQM+p1LA3NJeG7=ebVw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: re-enable acceptance of FIN packets when
 RWIN is 0
To: gmbnomis@gmail.com
Cc: Eric Dumazet <edumazet@google.com>, Neal Cardwell <ncardwell@google.com>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:20=E2=80=AFAM Simon Baatz via B4 Relay
<devnull+gmbnomis.gmail.com@kernel.org> wrote:
>
> From: Simon Baatz <gmbnomis@gmail.com>
>
> Commit 2bd99aef1b19 ("tcp: accept bare FIN packets under memory
> pressure") allowed accepting FIN packets in tcp_data_queue() even when
> the receive window was closed, to prevent ACK/FIN loops with broken
> clients.
>
> Such a FIN packet is in sequence, but because the FIN consumes a
> sequence number, it extends beyond the window. Before commit
> 9ca48d616ed7 ("tcp: do not accept packets beyond window"),
> tcp_sequence() only required the seq to be within the window. After
> that change, the entire packet (including the FIN) must fit within the
> window. As a result, such FIN packets are now dropped and the handling
> path is no longer reached.
>
> Be more lenient by not counting the sequence number consumed by the
> FIN when calling tcp_sequence(), restoring the previous behavior for
> cases where only the FIN extends beyond the window.
>
> Fixes: 9ca48d616ed7 ("tcp: do not accept packets beyond window")
> Signed-off-by: Simon Baatz <gmbnomis@gmail.com>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
