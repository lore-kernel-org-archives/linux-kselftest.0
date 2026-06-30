Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4801E3DCDB8
	for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841097; cv=pass; b=FurIJSUp/4oGZ5A1dtoZj7e8yzsxYLhEVJfUlacY6kYcsgn0chwh5TpoKIQkD0j4w93ISCWFeS0pLYoV91pKlpjI+11eveytuGc9WLOGsdwmKbEG0qfWRBLIyoMCbQZYERI0yJPMHC7k2ryHdeTyeP5fQ+WbSfKYADwSaBmylMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841097; c=relaxed/simple;
	bh=5/krHcBHI1JSub7aw/+IBY1ssuiydpPt3+zadRH9bUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SQn5ACvrv6tu3afXy9HcKz5lJaZ5/OT3zpnlBYDpDGxEE/yJk2y1DMWguSTQ3ncVQ8Hp3y122KOSxex4WAJ0I5GeNqN2dy4zABlggrp4QUf7c5v+lAqok08gy/g1Cn5P/UAj+fhdONB3n566BLaP2ACWh14S3N/zp0FD259kc9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ttUGDkqk; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ttUGDkqk"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-133362c30cfso699c88.0
        for <linux-kselftest@vger.kernel.org>; Tue, 30 Jun 2026 10:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782841095; cv=none;
        d=google.com; s=arc-20260327;
        b=BbPVFcSGuZOmBLdgASlCLcx7weH4VIsx3Pw986dRgf6Y20WdPbDQf4Zzl4/FpO3z1E
         Qp6o5nsfD8Ym1jtleBRFaMpiHpkxmLNTFJ9XWKg2kSkfvbAl9hlpbUDRXav7TrF9GERl
         Atx44zS6sex2iXusHs0NUK0LqGWYWTzpgRno+cChQsa7jSw/vAsunQK7Z9HgbL0431w0
         nmBF3NznQpCvIn3//L6dDUK882prFcf4vdiaKFfsyS1FKVdQwMa+0htLR79jj05lhB4U
         1Si6/EsuNTkoKW2i+Gkx3/lL9nRUPkpATcpoE97c7vqTnNj3jgk/b237aYmNSuDcK5ur
         BWow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PhNh1O8KJd77HVRv00phfDVEbbQW7UcJOtJ0dSSwrLo=;
        fh=IfQ7HMl9eJkzn0EUmb15TxmJolCbiX1wxxJqTVhuUt8=;
        b=gro/FDVHFVBHn+TxZwFn2V5nphDCJQKysKXAx7XPcroZYmbJsHlORawAe01JoTa4V2
         j80KYkrFvP+HpmAVMB5Bi70n5c4ifO3w/hZ+s2fdxxOrQEur051913HhwtnGISe8snu4
         w7TtpgJ/6tvwBTX6qp73n1h6DcEvgHGZsnbWOXX6Dk9bpU2UGhC0XXKrdjhuvxBHmSnB
         4gHOBRlhtTmZG22WFVDd0p0+NzquWLBPAxPnw20eutm4tAaYRhqfMua2vPbrWjqy1UFH
         qdGWkCJVWA14YQBFKk0zNRVp0yK6IMinbi7fOK1nOlNExgIWRSKDm5tYviIc+9svkXGN
         Lb1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782841095; x=1783445895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PhNh1O8KJd77HVRv00phfDVEbbQW7UcJOtJ0dSSwrLo=;
        b=ttUGDkqkp91LfVvWBcqkb9cgcxwOJlHBKScZcl5r94kpA3V3atVGFyFt7Itdab0C3Z
         /XtGiNSsfec5Ofk3JPJ4iIhs4/Byzt0SDGMCgFnRd9PXhQzfctFo5ynF8kEpz/v/qEuh
         QDXYvZ2vAwDXkKg+xgwm5315lr5hLoaswz9CyoM8ZSGOFz/eye86NEdNFrNHkm0kJtbZ
         /EEkBBEZrq/K7voUqznwPkM2x/aQIsL8Obvf8ruK1YS52W/5fk2I9pdiW3+7i9+lT2Q7
         7Aw3MXt2GY3gKhFTOJoMdMcZXmAiK/YC/8DYBxjZjBiYd+CHcaxqF2vv4gQYi83pN24b
         dTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782841095; x=1783445895;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhNh1O8KJd77HVRv00phfDVEbbQW7UcJOtJ0dSSwrLo=;
        b=h12j8WdMs9bqhuhfF+5ALqP6aXj0xaqpTVoQJCwXcWqjtn4igptGUMDcEraf7s8Id/
         /GvVXF06nNZnjcpykNwxeiwU/l1SNG99eQbbofR4JGsTgW65cQhlAnE13TpvyCirVjJ+
         RoiyOn6WeL2X2t00FU1bQBywEXNrg/eGD8Q+mLjKn1BmkSNQnehZPumZZSiAQdNbsLAh
         /jCs3Dub+1qipfbVPbfw6/vNzc5uns0CqmkAo7nAabHRvcERrxQ3yLKQ3VRTUk0ZTlxC
         Q5sjc//P/RoT8scVf3Z8IC3sHWhlJXy/5EZbByfVJnl9E0krSUQcpHyHoHT7p0DjVtA1
         XO1w==
X-Forwarded-Encrypted: i=1; AFNElJ8Ra4ZU81sYgRQaRsf+j/vKrfzprJWdpfmujSHimQSPdAPZi0eiqdnJAtH5tS+t4PZ5Z0tJqTIkFJhICfyXpRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN8yQBYnETy1ugZlIHZ2BeStsaqXD0h8sxVrhPwTi1DYbMbyuF
	ebBBMLMeWpeKzOo5vYSrJUT0Nue5+B6J5hMxAP1iMl6iNYQqLcaaq4Th62E1Rg8E/kZl3N+JAdd
	/RFa/dVRcOrTyN1VoV1/NW+UpYo27i+/L0u2d3r6r
X-Gm-Gg: AfdE7clg4DukqiM/0/34TVhbWML68zHEJC2Uj0tRXmY+icJtV2iPhXQUv1tS6+TjHrc
	9pAcdEj706fICPA6ZVKwD42wLfO2ekDjfVtacD31njl7+OieYowXAoYkc2YVsVUo7GsmAQMds7y
	9dnordp7E4nxNyPiydnJkLuMnLWIGaj9i0v8C8LqasFWFq3Iph5tJuQ93U5D5FBVggigqVwgPmb
	0MihTaC3Iuy29TNA6GF0s2rYVVBr/uXQkBmitYWFVJkFkhzDNUR/oZBr5OV9RXADxXGvDLXnzRY
	OFKhDKKJ00JKsoTzXOQjFLZ09E54X1YJOplE
X-Received: by 2002:a05:7022:689c:b0:133:52da:cb5f with SMTP id
 a92af1059eb24-13b33aefda3mr11573c88.21.1782841094527; Tue, 30 Jun 2026
 10:38:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629192029.4013794-1-tanshuhao@google.com>
 <20260629162619.55297244@kernel.org> <CAABY+HEcNnh+ATyA_JMg4LnVpP=egprTTi4UXxV9CfW2+71z+g@mail.gmail.com>
 <20260629181955.00e63b61@kernel.org>
In-Reply-To: <20260629181955.00e63b61@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 30 Jun 2026 10:38:01 -0700
X-Gm-Features: AVVi8CfIDRCEEftMp-9OYUT7tFXjHknuuH7nu2ohdOSy-r7PQmXeshFnOquXIA0
Message-ID: <CAHS8izNeoJiLyoyiPgzmX5CGcyivYqBpVxOcFnoxeOX_zzFd4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v1 0/2] Reuse threaded NAPI kthread across napi_del()/napi_add().
To: Jakub Kicinski <kuba@kernel.org>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Jordan Rhee <jordanrhee@google.com>
Cc: Shuhao Tan <tanshuhao@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 6:19=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 29 Jun 2026 17:47:03 -0700 Shuhao Tan wrote:
> > > Send a netdev Netlink notification when NAPI is re-created and
> > > let the userspace re-apply the settings?
> >
> > It feels surprising that the userspace needs to reconfigure thread
> > properties when changing NIC configurations unrelated to threading.
> > Another downside is that when userspace configures NIC configurations
> > in quick succession, re-application becomes messy because a previous
> > re-application might still be in progress when the thread is gone.
>
> Can you explain more about your deployment and system configuration
> flow? We may be adding micro optimizations when the problem is that
> we recreate the NAPIs in the first place.

We have an AF_XDP application with extremely low latency and jitter
requirements running on our servers. Sami developed busypolling
threaded napi for them. Since it's an AF_XDP application, they attach
their umem to specific RX queues, and then configure threaded NAPI
busypolling to achieve low latency. That involves using the Netlink
API to set the threaded/busypolling property, grabbing the kthread
PID, and setting some properties on the kthread. Concretely, something
like:

```
  local napi_id
  napi_id=3D$(call_ynl --output-json --do queue-get \
    --json "{\"ifindex\": ${ifindex}, \"id\": ${q_id}, \"type\": \"rx\"}" |=
 \
    jq -r '."napi-id"')

  echo "Enabling busypolling for queue ${q_id} (NAPI ${napi_id}) on CPU ${c=
pu}"
  call_ynl --do napi-set --json "{\"id\": \"${napi_id}\",
\"threaded\": \"busy-poll\"}" >/dev/null

  local napi_kthread_pid
  napi_kthread_pid=3D$(call_ynl --do napi-get --output-json \
    --json "{\"id\": \"${napi_id}\"}" | jq -r '."pid" // empty')

  taskset -pc "${cpu}" "${napi_kthread_pid}" >/dev/null
```

The bug is that the taskset configurations disappear when the user
runs an unrelated ethtool command. Yes, the root cause is that an
unrelated ethtool driver config on GVE, gve_adjust_config() will
recreate the NAPIs. My understanding is that NAPIs are recreated on
ethtool commands as WAI and standard upstream driver behavior; is that
not correct? If we held onto the same NAPIs during driver reconfigs,
this issue would indeed be fixed. Is holding onto the same NAPI during
driver reconfigurations an appropriate/feasible fix here?

Other ideas, FWIW:

1. We could add an optional netlink argument, "remember_napi_kthread,"
that customizes this behavior for users who want to remember thread
config.

2. We add an optional netlink argument: "bind_napi_kthread_to_cpu"
that not only sets threaded but also binds the created thread to a
specific cpu set, and then include that cpu set as part of the
napi_config so that's it's remembered on reconfigs.

But I think the best options are (a) not recreating napis during
driver configs or (b) this patch to park/unpark the thread, TBH.

--=20
Thanks,
Mina
