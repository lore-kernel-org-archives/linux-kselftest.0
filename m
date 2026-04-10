Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F61D387362
	for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 08:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775809993; cv=none; b=Jj0s+x01boWYJmhT0WPkyNhv4PHvRBdDo+7/WkdysT7+eq6YCyU1zpUk3iwahwpFippcOpxPHqgQnJISoAy2f83EuJaxbCHAYkMpsKwg7CtQgN7rG3ofs7w0HxYmBdzrMoP2RuPZAZMYpmfqfSF6SOSDBBKZ89IrwB0LNoVcYX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775809993; c=relaxed/simple;
	bh=3P3Yp7kZAgzbJGxtHzxC2EX0OREVvZPZwUK5CbfY+SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHKilJ6vDRC1sE3VONA/LL7We0sY8gAbJeJnRckIUtj6It2jGwtXphu2i0zKj7gWobpNihCT4yn3KuCFUbYDbTRYtfSlVxICc84x+VDlsRDlK6DcBcRstgQBXyRIzivZllDmrZ58YZH47aXiZMWzYAdJwvwR5Z7Vz5bq/TeNC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EqQjo4V/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UrtQaKx7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EqQjo4V/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UrtQaKx7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775809991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AbV+a2kN0fqhbaSyrzX6IchPn1p4RqFKSu0TwhqfCNk=;
	b=EqQjo4V/BMjG9wgzdaYDd/c9EiH0XhApdLGZke6CdJrHLAK9AZSSJxBPtuzU2wE5XvgTMY
	WSkZ7kRdDl9TUVVvPwya1WTYp0G+1iicGREu8KGFjlhD0Wu+y0d0wwftWLoEvx7X7eDQwh
	27r4LLxWloS/lgFR4qR0HPd7dVtfJlg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-TSbWleYZOLuNrMoRbIrc8w-1; Fri, 10 Apr 2026 04:33:09 -0400
X-MC-Unique: TSbWleYZOLuNrMoRbIrc8w-1
X-Mimecast-MFC-AGG-ID: TSbWleYZOLuNrMoRbIrc8w_1775809988
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4839fc4cef6so15290905e9.0
        for <linux-kselftest@vger.kernel.org>; Fri, 10 Apr 2026 01:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775809988; x=1776414788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AbV+a2kN0fqhbaSyrzX6IchPn1p4RqFKSu0TwhqfCNk=;
        b=UrtQaKx7UDHS0qzc2oIghv70modh1UUgsZ9y2ulbSGDwsolLOusN4l0t55GLna/c7x
         xgcvb0hfG4ZrXvc4ENx12Vy2bwA/nsA7/tJc1qBbBJYZg6tPp73jHgfiWMS8SbIxLiAf
         U8jXbb89uAjigiORrXkx4mVkvDLGHDk+Em7rjpMvWeTlDddu7Ug0PY8sKjbieRqWkBPN
         OWthFcVKSGZrrwkvX1oFixjQ2yrNyAcHn50riRgqyxx/Ijcv56FgvKFQxbRH0QPHaHFo
         etZbDA76EPr3MkOjbLk6CwpmJlcERY/PuPgTsI//XIxe5rg3Fxv6EFsdxUiA5cdqupWv
         g87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775809988; x=1776414788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AbV+a2kN0fqhbaSyrzX6IchPn1p4RqFKSu0TwhqfCNk=;
        b=mAgksXjbzBzpSoS/1uhy4nX1BQMcvbbyEg03NyinIBY6hRkkxPDKTkim0BtbXBCLDX
         KOulsFjOd7Tp5FF5pseSviLkfX34QKTBmTa8NvSUCQKbZLv//wyLOel3UQfUMZy0MNi8
         QN4/MKQdRbJn6dwud1vNQwrOAvhZJCVClvQRKYUtWLyWFYA9+8+ub2YS9MgAhUHEmTgo
         pXxkwDQ91BttmHZQK77Q1366RIVlZC78B2ZsadwTdzOk6jRJaucfLVl3NAt0Ut46GRzB
         Fj5hkUSd1FK2iCP/Ya1JPTHTdY28C+26Aft+0mDVCz/E+ofNhNCpb6yzmbrOdvYzOQxN
         7a9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+JmSbZmM7apc0waQ6bQxqHdg1ugZFiMIPyEYrk+RrpdATVc4Tzo/X2TU5QeYlzyS9tteaQGHBNrzEiM52s1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3HEfA7UNyvquzOBhax13UduNGZvEKMn0Gyuzt/+nmrafdee8
	o62aTd/Bay8QWXfSvtyk9j2/FV+oQxtXGvxTx7gA0RGaI8UFcNthvMe5hQCGFPS3AGKESURoyRA
	WXbUifNf2NpxIfq6ssCTuMC2LahF0A0bn1aOQea3985AYlFyrThGjmEMKt3Xkiqcn+HnCLQ==
X-Gm-Gg: AeBDievnmEHSq4xtpZ9lGiY9OU4wdilyB891inbM85G3aH+l0EKuu9lypc5af7lWmWb
	8hQomH/KL7PA0keUwn/NKLIiQiz9zQV0QgaeHq7/H6LIm5xnS1ovvCD6D7T2TFtjIsaPEGqKXck
	+e9Y4XBwfBtm+s7FoqraRYEgR2LjSoe9MkUcW9L5L5x5s99FwMoWrISdPr8TE+WZQ19u+XAVEmU
	Mwwc6ZYtxRfQJzCyfGZch5j0a2XJzLbfqollDsVPBapTP0F1qWn+MCk45IonuILp+oOZV1bVAAS
	Peqa2xijpOqsC185qNgd0Y5sNdO0rsrsJnIsMkOEBA/q9G4KmOMQKPdBmFhxSPr5FTgzLcv3ST1
	9B/1oGH38mH0MMPYEAwVskxP9M8Qd1yZttkTAQ5qozjgLI2RS49f6SzhOtPcvohRu7zZpC+C3dQ
	==
X-Received: by 2002:a05:600c:c10c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488d68cb8demr15409475e9.12.1775809988205;
        Fri, 10 Apr 2026 01:33:08 -0700 (PDT)
X-Received: by 2002:a05:600c:c10c:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-488d68cb8demr15409165e9.12.1775809987691;
        Fri, 10 Apr 2026 01:33:07 -0700 (PDT)
Received: from sgarzare-redhat (host-79-45-205-236.retail.telecomitalia.it. [79.45.205.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3c597sm53013275e9.12.2026.04.10.01.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:33:07 -0700 (PDT)
Date: Fri, 10 Apr 2026 10:33:01 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Cao Ruichuang <create0818@163.com>
Cc: stefano.garzarella@gmail.com, shuah@kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, horms@kernel.org
Subject: Re: [PATCH v2] selftests: vsock: avoid races creating Unix socket
 paths
Message-ID: <adi1X_3wVUsDhRmR@sgarzare-redhat>
References: <20260405195733.86043-1-create0818@163.com>
 <20260410035237.59644-1-create0818@163.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260410035237.59644-1-create0818@163.com>

On Fri, Apr 10, 2026 at 11:52:37AM +0800, Cao Ruichuang wrote:

No patch description at all?

>Signed-off-by: Cao Ruichuang <create0818@163.com>
>---
>v2:
>- retitle the patch to describe the race being fixed
>- replace rm -rf with explicit rm and rmdir cleanup
>
> tools/testing/selftests/vsock/vmtest.sh | 16 ++++++++++++----
> 1 file changed, 12 insertions(+), 4 deletions(-)
>
>diff --git a/tools/testing/selftests/vsock/vmtest.sh b/tools/testing/selftests/vsock/vmtest.sh
>index 86e338886b3..c345fa539d3 100755
>--- a/tools/testing/selftests/vsock/vmtest.sh
>+++ b/tools/testing/selftests/vsock/vmtest.sh
>@@ -718,6 +718,7 @@ test_ns_diff_global_host_connect_to_global_vm_ok() {
> 	local pids pid pidfile
> 	local ns0 ns1 port
> 	declare -a pids
>+	local unixdir
> 	local unixfile
> 	ns0="global0"
> 	ns1="global1"
>@@ -736,7 +737,8 @@ test_ns_diff_global_host_connect_to_global_vm_ok() {
> 	oops_before=$(vm_dmesg_oops_count "${ns0}")
> 	warn_before=$(vm_dmesg_warn_count "${ns0}")
>
>-	unixfile=$(mktemp -u /tmp/XXXX.sock)
>+	unixdir=$(mktemp -d /tmp/vsock_vmtest_XXXXXX)
>+	unixfile="${unixdir}/sock"
> 	ip netns exec "${ns1}" \
> 		socat TCP-LISTEN:"${TEST_HOST_PORT}",fork \
> 			UNIX-CONNECT:"${unixfile}" &
>@@ -758,6 +760,8 @@ test_ns_diff_global_host_connect_to_global_vm_ok() {
>
> 	terminate_pids "${pids[@]}"
> 	terminate_pidfiles "${pidfile}"
>+	rm "${unixfile}"
>+	rmdir "${unixdir}"
>
> 	if [[ "${rc}" -ne 0 ]] || [[ "${dmesg_rc}" -ne 0 ]]; then
> 		return "${KSFT_FAIL}"
>@@ -814,6 +818,7 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
> 	local ns0="global0"
> 	local ns1="global1"
> 	local port=12345
>+	local unixdir
> 	local unixfile
> 	local dmesg_rc
> 	local pidfile
>@@ -826,7 +831,8 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
>
> 	log_host "Setup socat bridge from ns ${ns0} to ns ${ns1} over port ${port}"
>
>-	unixfile=$(mktemp -u /tmp/XXXX.sock)
>+	unixdir=$(mktemp -d /tmp/vsock_vmtest_XXXXXX)
>+	unixfile="${unixdir}/sock"
>
> 	ip netns exec "${ns0}" \
> 		socat TCP-LISTEN:"${port}" UNIX-CONNECT:"${unixfile}" &
>@@ -845,7 +851,8 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
> 	if ! vm_start "${pidfile}" "${ns0}"; then
> 		log_host "failed to start vm (cid=${cid}, ns=${ns0})"
> 		terminate_pids "${pids[@]}"
>-		rm -f "${unixfile}"
>+		rm "${unixfile}"
>+		rmdir "${unixdir}"
> 		return "${KSFT_FAIL}"
> 	fi
>
>@@ -862,7 +869,8 @@ test_ns_diff_global_vm_connect_to_global_host_ok() {
>
> 	terminate_pidfiles "${pidfile}"
> 	terminate_pids "${pids[@]}"
>-	rm -f "${unixfile}"
>+	rm "${unixfile}"
>+	rmdir "${unixdir}"
>
> 	if [[ "${rc}" -ne 0 ]] || [[ "${dmesg_rc}" -ne 0 ]]; then
> 		return "${KSFT_FAIL}"
>-- 
>2.39.5 (Apple Git-154)
>
>

