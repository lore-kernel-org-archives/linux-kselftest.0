Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFEC3B3BF7
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775812010; cv=pass; b=cvMq7jLCmrUUHwho6kv+C7BotY0mwwdeNYfSYyw0mnPoJDM8zWAHwbV1jHSv+RrYZZUePzRf2lL2F7SmJYP4q+NVsZ5p7v3ZfadMzngOAMDZHYHytUIJD4+GhUv+7IXRJoXjYaauV2kfX0o4a8M+gEx/uSnnLXoCcFn82AcGxxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775812010; c=relaxed/simple;
	bh=mkRB3+rS1m3805s8GQTj2HfkmQ2P2SWXAkPM7ASB7ME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLTavUxHmPlc456GLLMbZ0WCzcdP3/obHAS5vcP8aqNqY+EPuY6AFPu5wCYFfgVjRbeFTZWLAY6EaBuR+EAJxAi8CsTDQI3OmmsLE02nmn5iErq2j7JgYoX8FldP+c+mz00wJUUgZTzMbJ50bsRO1DKWTxX33gcemHQy54a4Ry0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LBK7lFu2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WILM026P; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LBK7lFu2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WILM026P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775812007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MfU0YWSJIfl9AQo8fY3otc4QhRCrsnnfRWzfq3Ua0cM=;
	b=LBK7lFu2hAYD57dNrwiXfUCR91vVRYRAPCXLRLb+/lH+0TbCCEVnflGewXfjrGpkyA3tEB
	FIbmT++PY6WA1jleKSZ93V59/izmch5hfN+xwelf3v5NVO31mzYejU4dlUJOj2JJQZNllC
	BxibLHqM0lUNkpGRzYxyz4r4yofau14=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-7-IbBmu_N1eQH3ru0_7RPg-1; Fri, 10 Apr 2026 05:06:46 -0400
X-MC-Unique: 7-IbBmu_N1eQH3ru0_7RPg-1
X-Mimecast-MFC-AGG-ID: 7-IbBmu_N1eQH3ru0_7RPg_1775812005
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so5615725ad.3
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 02:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775812005; cv=none;
        d=google.com; s=arc-20240605;
        b=kcx4BCiYpLXV582WvLHHRP2ZeL2gdWFkaegsfOiW2sSbTa3CsgWR52yPWP1zabMPLG
         Tf45LRNSL7jLK3M2TZfFYIpgCMMuglyZ44lnfQIzgsDGyi73ANpsc3I1gE88VG14CpPU
         nOm5m3g44FVUCFUqjaweyw9gkolWBvU2yVkOYzXav/6oe/GaAUo/gsqM7k02SHguD33D
         rL2AiYB1Vx0UNJb9E0yDO8TnAZ5gdkUK4HJiX9qOOv2JkyCIE1Kl+hCOi71iCq/K28O0
         6S0YSRW+DzJ7DMce2q65x5NepiICeGLxBQw1WoYboHVNCtqdbCPlfZ57+7y/5fUbwnLK
         /kNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MfU0YWSJIfl9AQo8fY3otc4QhRCrsnnfRWzfq3Ua0cM=;
        fh=8xJ3vf7qgD9o46BRBdWoo6JQLwSVUK10c349bNcLZLs=;
        b=DcWRMRobroDwq7cPp+tpXLkunhPdtjHDLCpWHg6GjoNK2gqG5uhC2A34oz5/yZkhW1
         kYhQ21c/aLjTD34ilVsV9ow5W4pXLIlsrwqOfMpVrMylyfeZHl4SZZZyaT4KNNNwqufa
         rQFNvOie1PlwYroM2kBlqgV2huj0+0m4JadPVUPx8cbgVwmps6GQmiy0rAFSt1zuFZVh
         f7U6RdEI2OLObDCm81APKrEdJTJaaUnCT6qxhp52DMAo3hipgsRopbDYrGuZeBGOcxjT
         JaXL996gAxxRPsLvUu3Iu6/QFzl4b0sJGxSJ5QqnWcwe23SqB776OPAvljsBwx645TZl
         GPNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775812005; x=1776416805; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MfU0YWSJIfl9AQo8fY3otc4QhRCrsnnfRWzfq3Ua0cM=;
        b=WILM026PYc/l5G2KfbB7RfZm9na8Mqf8laBdNw6cnssEy8c45BBYc0WxvNo9qVZsaX
         KbeJgCgGhBZ+jvBZ6lmtdMrSaP0NPD/LJ6wKbSg05/IPNQhDQ1nGwV3Xu3PvkE/JcIpW
         0PCaQflU9A9WfYLwlf8W9L8s+eArPqGIDZogPGzIJCDG2/e4qR+94YD81cs1cOMNHTxL
         +1iAJ1pJrF0Dsak34InxtSpIIyNrlVlpOaOBzsu3sAA5zm6xIszQRKjU5VrD31YgP5hB
         50emK3crxvFQWpGnHnYR5w3vZQqrOLbFm3nRXpa19ZJUyWQUDk82r/EI/msqKJ5NTjb3
         D8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775812005; x=1776416805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfU0YWSJIfl9AQo8fY3otc4QhRCrsnnfRWzfq3Ua0cM=;
        b=A9yRLiv4acayCWg8R07YYHvYXS6wgLFu9nQxoRFhvIuBX+4pEh9rewBZ9blXnoql4c
         9jFT8YoPXNU2j+v4zWhy8aHybMx/JdsQj3tgd/1XO7HL5icOagrfSxx/YpTAWjgWbGt1
         AoWxOjb0X2hUumuuQJ0a7R1byb/UXLQoHnOEg5DB3P6gTpIJyUPNJ/c+1SZ6aFP4GNnH
         o3et0ZJXjMXeNYfngjZQX2yD7pEEpG8UcMmUTQH40E+d7m2KRCHg2W2YivbLCxZxL1hg
         fBddUXFzOdDwjbZk2TiTAC3WX32PUBk+cqJ03C3yZf/oP6suIf1QRfAk700fsEjtEDFW
         Vo0A==
X-Forwarded-Encrypted: i=1; AJvYcCXxJyjYDaeA05pthdLUM/K5zCDuj14b/nFjhfK8JWNCSUnx7VG+yjGjKr2Sa1xqoVVs9q5qxG99FpdxUeE5ALc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxudpQPwROyNi5jSvU85EM3Rzvvp0qeQj6e9JVI9gwxwjsN+mig
	zYm+zuXZLMZXhdOIlzxTW01pj+x5fZGWeOty9qewPGudy2r/+zAz7ojlPBmHbbQIvdvEaduHEWb
	9uHpyUpKuVE3YHGgIZzdd5VjHGhoqo6w9zUVW4ybOTRKAsB5gYm7kKXVKV1sxOnOZOgylgRKXNn
	pCy8wba0tx48K3RaWetV2KXki5Y4y6PQ4VF4w7Fsr285xi
X-Gm-Gg: AeBDietBjpnOuJcjYe5SVQQicaqfq6DWSX3evkGB3tPQjv/Qw7+PjJXXci8DqbueAdP
	azvHdbbSru0NQP9O0i5NEbRxf+iG18gwoW4+vpx3b8JMczwpzhM7BCA37RxCZi6I6guOsXqehCv
	vf4pR8RXsXOAcE5k8yXzPjtvEYfJUfgI9H7Xu+2njwyTbRhhgdpj6S6mJyg59V3S3ig8PdIBuei
	PmfjQ==
X-Received: by 2002:a17:902:f0ce:b0:2b2:41a9:8e10 with SMTP id d9443c01a7336-2b2d5a3c39dmr14965875ad.23.1775812005352;
        Fri, 10 Apr 2026 02:06:45 -0700 (PDT)
X-Received: by 2002:a17:902:f0ce:b0:2b2:41a9:8e10 with SMTP id
 d9443c01a7336-2b2d5a3c39dmr14965435ad.23.1775812004685; Fri, 10 Apr 2026
 02:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260405195733.86043-1-create0818@163.com> <20260410035237.59644-1-create0818@163.com>
 <adi1X_3wVUsDhRmR@sgarzare-redhat>
In-Reply-To: <adi1X_3wVUsDhRmR@sgarzare-redhat>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Fri, 10 Apr 2026 11:06:33 +0200
X-Gm-Features: AQROBzDVhsz7kNUJ36YTaPNuvynQFY-Dt0FMLOERsUNJeRpJCN7EnVLjvVRFZ1o
Message-ID: <CAGxU2F4XpzQiKwboQt9UEpxY+Gzsq7qyR5CMLZO4F_hGqTpndA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests: vsock: avoid races creating Unix socket paths
To: Cao Ruichuang <create0818@163.com>, Bobby Eshleman <bobbyeshleman@meta.com>
Cc: stefano.garzarella@gmail.com, shuah@kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	horms@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Apr 2026 at 10:33, Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> On Fri, Apr 10, 2026 at 11:52:37AM +0800, Cao Ruichuang wrote:
>
> No patch description at all?

Also, maybe better to CC Bobby.

Stefano

>
> >Signed-off-by: Cao Ruichuang <create0818@163.com>
> >---
> >v2:
> >- retitle the patch to describe the race being fixed
> >- replace rm -rf with explicit rm and rmdir cleanup
> >
> > tools/testing/selftests/vsock/vmtest.sh | 16 ++++++++++++----
> > 1 file changed, 12 insertions(+), 4 deletions(-)
> >
> >diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
> >index 86e338886b3..c345fa539d3 100755
> >--- a/tools/testing/selftests/vsock/vmtest.sh
> >+++ b/tools/testing/selftests/vsock/vmtest.sh
> >@@ -718,6 +718,7 @@ test_ns_diff_global_host_connect_to_global_vm_ok() {
> >       local pids pid pidfile
> >       local ns0 ns1 port
> >       declare -a pids
> >+      local unixdir
> >       local unixfile
> >       ns0="global0"
> >       ns1="global1"
> >@@ -736,7 +737,8 @@ test_ns_diff_global_host_connect_to_global_vm_ok() {
> >       oops_before=$(vm_dmesg_oops_count "${ns0}")
> >       warn_before=$(vm_dmesg_warn_count "${ns0}")
> >
> >-      unixfile=$(mktemp -u /tmp/XXXX.sock)
> >+      unixdir=$(mktemp -d /tmp/vsock_vmtest_XXXXXX)
> >+      unixfile="${unixdir}/sock"
> >       ip netns exec "${ns1}" \
> >               socat TCP-LISTEN:"${TEST_HOST_PORT}",fork \
> >                       UNIX-CONNECT:"${unixfile}" &
> >@@ -758,6 +760,8 @@ test_ns_diff_global_host_connect_to_global_vm_ok() {
> >
> >       terminate_pids "${pids[@]}"
> >       terminate_pidfiles "${pidfile}"
> >+      rm "${unixfile}"
> >+      rmdir "${unixdir}"
> >
> >       if [[ "${rc}" -ne 0 ]] || [[ "${dmesg_rc}" -ne 0 ]]; then
> >               return "${KSFT_FAIL}"
> >@@ -814,6 +818,7 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
> >       local ns0="global0"
> >       local ns1="global1"
> >       local port=12345
> >+      local unixdir
> >       local unixfile
> >       local dmesg_rc
> >       local pidfile
> >@@ -826,7 +831,8 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
> >
> >       log_host "Setup socat bridge from ns ${ns0} to ns ${ns1} over port ${port}"
> >
> >-      unixfile=$(mktemp -u /tmp/XXXX.sock)
> >+      unixdir=$(mktemp -d /tmp/vsock_vmtest_XXXXXX)
> >+      unixfile="${unixdir}/sock"
> >
> >       ip netns exec "${ns0}" \
> >               socat TCP-LISTEN:"${port}" UNIX-CONNECT:"${unixfile}" &
> >@@ -845,7 +851,8 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
> >       if ! vm_start "${pidfile}" "${ns0}"; then
> >               log_host "failed to start vm (cid=${cid}, ns=${ns0})"
> >               terminate_pids "${pids[@]}"
> >-              rm -f "${unixfile}"
> >+              rm "${unixfile}"
> >+              rmdir "${unixdir}"
> >               return "${KSFT_FAIL}"
> >       fi
> >
> >@@ -862,7 +869,8 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
> >
> >       terminate_pidfiles "${pidfile}"
> >       terminate_pids "${pids[@]}"
> >-      rm -f "${unixfile}"
> >+      rm "${unixfile}"
> >+      rmdir "${unixdir}"
> >
> >       if [[ "${rc}" -ne 0 ]] || [[ "${dmesg_rc}" -ne 0 ]]; then
> >               return "${KSFT_FAIL}"
> >--
> >2.39.5 (Apple Git-154)
> >
> >

