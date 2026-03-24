Received: from mail-dl1-f99.google.com (mail-dl1-f99.google.com [74.125.82.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C549829C327
	for <linux-kselftest@vger.kernel.org>; Tue, 24 Mar 2026 01:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314548; cv=pass; b=p9+nYe0UtCt9stKiOuT/o2zHlpW+ofxj2f2ZeiS7ckWkGn42n8PnRKwWityrvU4ORa7uCxNTw8tcfD9RUXZNS0/+eqjyNPAax9L+rbJCUsuVkJnblgVnPD4SEs6U3i5nRd53+79zJY47NJ0hT4vBTKNr79ivejfKj3Qi32DCETw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314548; c=relaxed/simple;
	bh=lZEqQPFmxcl05am0f6S7tXEDwR4Bv6s73O+SuK2tdWE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujlLYHplI1G0QCDDV3gAA41fMcnSTkVeqy3ugIMbU7fB97u/ugFyMy5yuCsq8ZJV9lqU1ABkku3fRkPbZg0ugMvlcEr20E/k5KsUzKjx6fMLp6LMooWAH8W7DBY39ufwd8VsxxqSt39YQyrH3F8VeAk2SUTpgYOyzjbA6TlFN+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FGhTii3Q; arc=pass smtp.client-ip=74.125.82.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FGhTii3Q"
Received: by mail-dl1-f99.google.com with SMTP id a92af1059eb24-128e4d0cc48so3735259c88.1
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 18:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774314546; x=1774919346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obf5SoubQH2FH1OtLEWm8uRcxli6UYVBABAQ1Wz+6xo=;
        b=U/VRT1GcGRnVpgpq2U3OniWA58DJQhJ9h0BM7k+sh6uWlM+dS5fp3GTLDD1pjbGqRC
         id9RMqUddprFS0gWSR/Xs5/gNw4iToV0309IyGfmhLcjYev8sXPem8YJNXFs9jA1jgTo
         89b4xWrb0NqWxJO7oBSPjseB1RPid4lSnvezTUoDwCgCgN/QxPJId+VLuT3F5tfsuDBg
         +UjCrlcP42pQWnYnSeL3t43J8qE6XZqHDf3X1rKFPj7Tb/+6nyLjWNE8W56uj0vQbyeF
         lXMY1I6t/bqA4rqjxNgLpSSjAmUEn0G2SAvhA9FCxmSKmHjkci0GLcRE3stZ+4eCkTEp
         1oPw==
X-Forwarded-Encrypted: i=2; AJvYcCUiKVf8ypZGchDHdWN2e+EezbWX9Ac6QZjTk7c4KaQx6rLQ8oW+lxm5nekoKiqBemQldfVddkq6l4vNfdZYK0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWyLqY0KMckBioWbkEZe38dWmE+kweU1tYUKJMtNHJEVjz1nAE
	8thG9T08K8z81YRW6CGvnekrhWPPUNVmafPli/tSPfSdmX/KCzEYsuBUavrqGsJ6I2nXSCwv4/e
	ehBZvqe8SmxpgmTMhbM8xmmTwOcPchbnPGoSDKHdecLYMJz6iHbz4ytBoLwuLHN5+RAu6SyfUZq
	4Q6Yv+SHVf/IMGcvEY8PswWZQzDQwoXYHbMB6t77DP8ObCiWjErQClOl+MuLxiQlBukEGwqfzSI
	ggPxtozaabyFzEabWF82gI=
X-Gm-Gg: ATEYQzy3EUhB06RZZ96eFylJyen2lVACCIgj4yGD1uXnvpR+GH0Kwkd+wpuRc41bB9a
	cJWQ5Nksbxy2Bg+twP58GT6l4RnRMJ0ruDmafw+6ESuzz9LD5IAoxN6RiOnm/mVF8MLendfoA9K
	Lo+NBwMnQ/FFAc9RHfnqEoJ+ew6mOZHSyy5eacUNhFK0JuTXDPkRYDv+ba3TUuXxWzOCTHb5Hpt
	UToGB8J7OQtZHGJ3A+ybbJw5ebEzEPnYAuF35EtX+UECdUKR0JG5BG9j902quWMZwZ+2zi5LxNA
	ixjsCipLbJs6/ztzX+ZIS972SSkt7Cz0ddxtsy5Gv/vNGqJggm5g+eYlq7LqS6zVF4wpr0Rw+/7
	U2Cm5LIW/DVkORNSZI7DW4zH+Ap2P0j18yWj5v3V9k6ljUnGdk5ssnc87ZEtIMwn1Ks8sP/315U
	LFH0OLXbHwFXuMEhUdC7/9eG9dgxMXUI5Y+JWMJZtps6jDLM4gk7jJ9yIUuEg=
X-Received: by 2002:a05:701b:2919:b0:128:d29a:3d38 with SMTP id a92af1059eb24-12a726e1f96mr3205286c88.26.1774314545595;
        Mon, 23 Mar 2026 18:09:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-12a733c0413sm688578c88.1.2026.03.23.18.09.05
        for <linux-kselftest@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2026 18:09:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b97a3f9ebfaso69972566b.2
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Mar 2026 18:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774314543; cv=none;
        d=google.com; s=arc-20240605;
        b=KMfJBNga4tdDYKN3RncOeKxquFT03C/v6CtqVW070sqb+OQ7DtxRNVRJCcgC1t8UTS
         UT/4Zv7iuWkTxcJfuzZoEBu3+xctFhT7J/mJ5ycOQ9lW+LKGImr4vbC7B0LWP4q4l69W
         +EzxmChLE1www9HhNeSldm5466wI5JM71jITOzl41o3CbY+Pgq7kXyKoO3sBJN4+sqw2
         0JohN0AfLzrOJyp2HbcWh/hw8N0GTEfs2FdZzAmXkuYRMVFCoIjCHe4q1WdXcerk5vdt
         efGujtTS+RgqjzifpAimpVffXvG8tJyxraffyRaUCKZvakOSaKzC4h+mVhdBfGOIxIaz
         ++iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=obf5SoubQH2FH1OtLEWm8uRcxli6UYVBABAQ1Wz+6xo=;
        fh=+5vcVN5FuF1FOnoGPp65v9ESxwEoHLZIQ0EpTT+eM00=;
        b=fCiW584RJ06QKyqqDFQ6pruAOELeAxCillRb1SlRt5OYIZn3XvDAdJFGqWbqRv0Uj9
         6mXUjBBfzKLSwCKH2kCHA+Laiv1KeNSyP6+0HSk1FYSysDYyYf92+uSOn1AARY/h/3hU
         eshu6b9Pr6p+sGJn8BPxXHlAist6btPlds8YoyZzwusoWcsZz5mdWr9bNzQNwSyC3EfG
         jEdDBgtCtBLHRVFcPCgmooC3gYNwvhaFhI2GYC8t7iRf5CLt0MLj1VnYOnM2MGwXF3xy
         ZtPQeZ/yo81Cbz4ItWsYfyI6yWeKGC281i4LEP3ib/bqmBucXRc8XZ/027xuDBnVH4Ig
         WoMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774314543; x=1774919343; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=obf5SoubQH2FH1OtLEWm8uRcxli6UYVBABAQ1Wz+6xo=;
        b=FGhTii3Q2Ut5eYnMcpvN3graq0xoYWzWNm+tfB7Ycl5UAm9cg13ejPjOamYYEYdOUk
         kU1v/wHAIDUQdOADySGL2NHHkkDZWIZBHVi7DxdCtEDmFLn5cx21RM2x0FAoSx7qDMZV
         TAgjWpBRwW4CmeQd+TRP4WNj4fxefK4kAKK9Y=
X-Forwarded-Encrypted: i=1; AJvYcCU82ARV+ncGdpMe8Ken3SWb6uykqhpAquN/Mdp2oIs17sNWcp5egyWJyMZvDh+42a9JFf+0dpU0LOJJu7IIl40=@vger.kernel.org
X-Received: by 2002:a17:907:6b0e:b0:b96:db93:5d0e with SMTP id a640c23a62f3a-b982f4e6533mr1073948866b.41.1774314543388;
        Mon, 23 Mar 2026 18:09:03 -0700 (PDT)
X-Received: by 2002:a17:907:6b0e:b0:b96:db93:5d0e with SMTP id
 a640c23a62f3a-b982f4e6533mr1073945666b.41.1774314542785; Mon, 23 Mar 2026
 18:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320012501.2033548-1-sdf@fomichev.me> <20260320012501.2033548-9-sdf@fomichev.me>
In-Reply-To: <20260320012501.2033548-9-sdf@fomichev.me>
From: Michael Chan <michael.chan@broadcom.com>
Date: Mon, 23 Mar 2026 18:08:51 -0700
X-Gm-Features: AQROBzBKAHCpXL_0uNaZPLnOtADU_LCPjRl7n7D8OXK2y_iwcTGmn-vseoYacPQ
Message-ID: <CACKFLi=j7DO_d46jwZnmZ=OfmkoFA3AXUoX4nmF0tQuYt5Y3UQ@mail.gmail.com>
Subject: Re: [PATCH net-next v3 08/13] bnxt: use snapshot in bnxt_cfg_rx_mode
To: Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, andrew+netdev@lunn.ch, pavan.chebbi@broadcom.com, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, saeedm@nvidia.com, 
	tariqt@nvidia.com, mbloch@nvidia.com, alexanderduyck@fb.com, 
	kernel-team@meta.com, johannes@sipsolutions.net, sd@queasysnail.net, 
	jianbol@nvidia.com, dtatulea@nvidia.com, mohsin.bashr@gmail.com, 
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com, 
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	leon@kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000001957c9064dbacc96"

--0000000000001957c9064dbacc96
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 6:25=E2=80=AFPM Stanislav Fomichev <sdf@fomichev.me=
> wrote:
>
> With the introduction of ndo_set_rx_mode_async (as discussed in [0])
> we can call bnxt_cfg_rx_mode directly. Convert bnxt_cfg_rx_mode to
> use uc/mc snapshots and move its call in bnxt_sp_task to the
> section that resets BNXT_STATE_IN_SP_TASK. Switch to direct call in
> bnxt_set_rx_mode.
>
> 0: https://lore.kernel.org/netdev/CACKFLi=3D5vj8hPqEUKDd8RTw3au5G+zRgQEqj=
F+6NZnyoNm90KA@mail.gmail.com/
>
> Cc: Michael Chan <michael.chan@broadcom.com>
> Cc: Pavan Chebbi <pavan.chebbi@broadcom.com>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
> ---
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 26 ++++++++++++++---------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethe=
rnet/broadcom/bnxt/bnxt.c
> index 225217b32e4b..12265bd7fda4 100644
> --- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> +++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
> @@ -11039,7 +11039,8 @@ static int bnxt_setup_nitroa0_vnic(struct bnxt *b=
p)
>         return rc;
>  }
>
> -static int bnxt_cfg_rx_mode(struct bnxt *);
> +static int bnxt_cfg_rx_mode(struct bnxt *, struct netdev_hw_addr_list *,
> +                           struct netdev_hw_addr_list *);
>  static bool bnxt_mc_list_updated(struct bnxt *, u32 *,
>                                  const struct netdev_hw_addr_list *);
>
> @@ -11135,7 +11136,7 @@ static int bnxt_init_chip(struct bnxt *bp, bool i=
rq_re_init)
>                 vnic->rx_mask |=3D mask;
>         }
>
> -       rc =3D bnxt_cfg_rx_mode(bp);
> +       rc =3D bnxt_cfg_rx_mode(bp, &bp->dev->uc, &bp->dev->mc);
>         if (rc)
>                 goto err_out;
>
> @@ -13610,11 +13611,12 @@ static void bnxt_set_rx_mode(struct net_device =
*dev,
>         if (mask !=3D vnic->rx_mask || uc_update || mc_update) {
>                 vnic->rx_mask =3D mask;
>
> -               bnxt_queue_sp_work(bp, BNXT_RX_MASK_SP_EVENT);
> +               bnxt_cfg_rx_mode(bp, uc, mc);
>         }
>  }
>
> -static int bnxt_cfg_rx_mode(struct bnxt *bp)
> +static int bnxt_cfg_rx_mode(struct bnxt *bp, struct netdev_hw_addr_list =
*uc,
> +                           struct netdev_hw_addr_list *mc)
>  {
>         struct net_device *dev =3D bp->dev;
>         struct bnxt_vnic_info *vnic =3D &bp->vnic_info[BNXT_VNIC_DEFAULT]=
;
> @@ -13623,7 +13625,7 @@ static int bnxt_cfg_rx_mode(struct bnxt *bp)
>         bool uc_update;
>
>         netif_addr_lock_bh(dev);
> -       uc_update =3D bnxt_uc_list_updated(bp, &dev->uc);
> +       uc_update =3D bnxt_uc_list_updated(bp, uc);

Will the uc list snapshot change between bnxt_set_rx_mode() and
bnxt_cfg_rx_mode() with the direct call now?  In the original deferred
update implementation, the uc list can change and that's why we check
in both functions.

--0000000000001957c9064dbacc96
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCCR33Mw
/YA8D9hJe2rawnAotsSH69SPoOptXJYmGQDmvjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjAzMjQwMTA5MDNaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAZK/hLs0Gm5EKim2KTMmzLSwFU9kz4BkvvzyAsOYD2
/+o8DpLIIx3C+1zyK4eo2/f0xcMbWL7tJ25Rg+uFfSmb2ZJ7T/QLj1uHSSIpW2k4X0OXIEpf71yc
G78A4ch9unqd9OTC5dP3L2fOy+DQu+WEckpdq3kehFtSdqMsSpTbpCMNPnPt64Csoz6jAyrNeQJ0
QboP8dBb10SexWfruwePEfwLCf3xCh72jB66zdgE7OhE8nurQafkPij1+YyoFqgLHXnrumW6SeY6
kDi3Tuwf+G4KTyR3Tq7RfyVaxpgIdqpeOZB/h3r4AIDvLv1wf7vD3tBf6mX5YpC8I96O79Re
--0000000000001957c9064dbacc96--
