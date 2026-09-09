Received: from mail-qv2-f5.google.com (mail-qv2-f5.google.com [74.125.230.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707EC55C312
	for <linux-kselftest@vger.kernel.org>; Wed,  9 Sep 2026 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967424; cv=pass; b=sNNd5+si58fyv5qixcP9M3kKNHmkrrCRHCKQVdQ1WZxXZOGtblJf7IL1imbW+EXBRDRsqglKH3cczLgtpKwyDZ394nVC/T0o5dVVPsE3/WKSKeJQcbsL4n18P7fG9KYnAXOjaJC52D1eF3BHUZWWiK+6FgXj1ZFW+/0/qtN/T4A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967424; c=relaxed/simple;
	bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WCLBd9EAac+8J0p38DUiaaUEgGNnvn1U3bR5DtP+8YDxExZMPzk3orrTuaejUTNSkzmB9hrxpmyeMW7ms1oV86LJFoKfC5fALF8A2N57ROR4mGh1AJ2SYybbWTZZZxgvckIbRacKZw/frAG1hQTfaAW6XB9UEMW9SY2SpPDqHUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwBZXu+z; arc=pass smtp.client-ip=74.125.230.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwBZXu+z"
Received: by mail-qv2-f5.google.com with SMTP id 6a1803df08f44-90cd1be1f12so22358316d6.1
        for <linux-kselftest@vger.kernel.org>; Wed, 09 Sep 2026 08:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788967422; cv=none;
        d=google.com; s=arc-20260327;
        b=GvcshoQsbil3zh3AFVCERrya0Pc0wspSlPvvOO8wFMKM8d5+710PCFoKXeP5iptmEs
         bDL6FnnjmqTOWgavgRDSeLvXAsogqjvnWDK0rwkMO7drgHjhd+swGGGU2jkiE/jLFvQf
         Wf2QOFx6awbAYQwOHwTjcB1D5cL0YxNK9gkDQa7UNyD7zhfRzbTJ8+ALlRlPP6Vv5G9L
         yKVEUPbvVg1zKYttCAD3Xx4l9wptHoiSwDLNQTF/BdryJI48BGHmdPvyCcgX37g8Xqqk
         b2a9BbjODzBvwhZ5C5Ra+0PJVo+EZfHfS+iXs63R9Fgc4rKLOU1l+y/CLiIa7S0ZryRx
         iIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
        fh=DUPNM90bGIxCxGUt259xQiAZo+/JtCsYqDGQppXS3Us=;
        b=TTF5PrkKJPCkilusUtmHNHgQAOk3vtGz8GQhn2TONVIBJ/qIccKfWKLD48ueeU+lHi
         Zb11L+F2/d/HOK1jQqz80Lrdwg8H1Z8ea0BzDqBkuSOw2NvWPcMeAd4zKCRd72DukY8j
         TlpuH0WYIhcYVMzVmAChQ1Geedf1djs4C7Ut3pXwGUx4dCsdDgjc9jvz6noLsP+vq5pT
         2sa53pq7/gcaIRzCYRO91l88Ih6T0viYpYg47qLWTGLE6sPraQoyNDj76POXLIOZWjWe
         VWrWdjQeux3smk6Dilm/+7saLbcWZ/Bk4jYqWPefNzhCbdGhpZj3SqA4FocqAKVAy8T8
         hD2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788967422; x=1789572222; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
        b=rwBZXu+zM5hHod+luLYt2+y3x9DO0Pt8xux2Gah9nNAyy3ETHjbUL1obDvpnAh5wkk
         oBxIzZug62dfqgsaDeIAfdU8H9E9Z/WF9JccEIPTya7jsWbn5vsB7Z67naz9z39dHr8x
         mNSGtZnUNdC9Nm0+0u77lBjLPy4QYdFS9ittiOcV9U38rzonjOmZLSGcNu8+gz+5YOnP
         2g+NQhjjkGk/LtAuDlYZrL8quHNAMwQ1KRkr3ZhTJwcnmQFqc/LVTdyV6u7EvkVSEWN3
         9BRQHdB04/jtfDg0cXhT04NiAbMnnDMXqOigcVYr3v7xzQxMMe+PZlzANBbMM28LCmrj
         I8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967422; x=1789572222;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgR3+XPzaA4eb1yREhzJJQ+MQmEe+bNTZ5LaRJWFRUI=;
        b=pUcEj7/R+setbv0rYbZQ5A6BiL9W4pnS2MlChvd2amZ0y2uLQbQ5o2bSAbKH5LYd3X
         gIL3f6XnbcQIqBqwk8tX707nEAneygZKm43GDRHsg54+BvgFGnsLuWHOcE6OqPjmPyxS
         oSkn8+oRs27Zv7zDL2MlShyThbw5q02LXXZY1hTtud8X0MJM2KZLti73pyVv8ckERq0I
         qJ3GkhUb6zuj7ZH4IdZ2bm45Z9bW1D6xLqSJQCPYGh66xlFjM7a0DvfG90GAPb2xaxwn
         U4AAHQUZPy9aEVcCBuwlujjsmMDHS1DBkWQYGlC1RoaU36Go0MHF9/CKzHm70asu4E5D
         kbIw==
X-Forwarded-Encrypted: i=1; AKwUvBx8q2fW6GlKZTtpE/QFOasabjeXLxwnMEF63o5Sh+IayujQ5gsBXZmXkYvyfO/gDhxFWuhvMT9HTyab2n42VnE=@vger.kernel.org
X-Gm-Message-State: AFuF++mmTSDPQJiPL+RbIPdDLCF+D+4jhcmLHkS8gUolL7wavIAxTLlc
	hCZrz/Ww+zDfdq7FbaTwnKlYw19UVtwKhWaXd5+b/c2FtlOFTA0JCD1Ww0pQvpNVlSl78Taa1ws
	/BZkc7kHUKJ/6swkSulgmNSJWTIjEbHQ=
X-Gm-Gg: AYBFou04ajjGsVS3p/Fprq9TCNYGsUFg50/bkhW1BsFoHyszOCmFrOkyFO1pxbCF/xL
	bkc8xC5pyuZwp1N8TYnckAcGejs7swEmTJ5Dnu23Nqcte6/VznGfKu3gsmovR/3GsVdH0xp/rSu
	smsTMvAoWGVXvvLX+LlVFzt084AdIBQ9IH5QVaK8rZx9ri0y7D39U+oj+fY2ukweLUjAMfZ4aEP
	xRyuPC5U1JvnHKVtYicoC5OFHBF83FRzvEeGEjkphyZqxJ4LautedhgyuRmAq2D38KJrCmOdXKX
	ZiFZBBf/iU6RH9UDiQHtMrl/pZ7Mv1fOwZNKRmzIyo8b3g8XEXutfg==
X-Received: by 2002:a05:6214:40a:b0:910:4a86:5975 with SMTP id
 6a1803df08f44-9104a865dafmr350346336d6.29.1788967421968; Wed, 09 Sep 2026
 08:23:41 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:23:41 -0700
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Tianyi Chen <diannaaav@gmail.com>
In-Reply-To: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
References: <CACGbirTvSoSeNSpMCBiifTdRKKDsKbgk7nfvh=09fHw2b0M4Ew@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:23:41 -0700
X-Gm-Features: AcwNN1Xs_Ic-TFWEWYafDXq-QgNp-3x50hyH1ZaRfp2J0FhUBBGeyv5j7fMk6x0
Message-ID: <CACGbirT2U3gCWcYSTVTZrf2xey_D8H-s3oE8h2WW0YrDTV_Yqg@mail.gmail.com>
Subject: [PATCH RESEND v3 2/2] selftests/mm: Only prepare ptrace_scope when
 memfd_secret is selected
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Joel Savitz <jsavitz@redhat.com>, 
	Tianyi Chen <diannaaav@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000b3b768065b0e6fc9"

--000000000000b3b768065b0e6fc9
Content-Type: text/plain; charset="UTF-8"

The unchanged patch is attached as text/plain to preserve long lines
and whitespace during mail delivery.

--000000000000b3b768065b0e6fc9
Content-Type: text/plain; charset="us-ascii"; name="mm_patch2.patch"
Content-Disposition: attachment; filename="mm_patch2.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: 8474edae0c98aec2_0.1

RnJvbTogVGlhbnlpIENoZW4gPGhpQHR5Y2hlbi5jYz4KRGF0ZTogVHVlLCAwOCBTZXAgMjAyNiAx
MToyMTo1MCArMDgwMAoKVGhlIG1lbWZkX3NlY3JldCBzZXR1cCBjbGVhcnMgcHRyYWNlX3Njb3Bl
IHdoZW5ldmVyIGl0cyB0ZXN0IGJpbmFyeSBpcwpleGVjdXRhYmxlLCBldmVuIHdoZW4gYSBkaWZm
ZXJlbnQgY2F0ZWdvcnkgd2FzIHNlbGVjdGVkLiBydW5fdGVzdCgpIGZpbHRlcnMKdGhlIHRlc3Qg
aW52b2NhdGlvbiwgYnV0IGl0IGRvZXMgbm90IHByb3RlY3QgdGhlIHByZWNlZGluZyBzZXR1cC4K
CkNoZWNrIHRoZSBjYXRlZ29yeSBzZWxlY3Rpb24gYmVmb3JlIGVudGVyaW5nIHRoZSBtZW1mZF9z
ZWNyZXQgYmxvY2sgc28KcnVubmluZyB1bnJlbGF0ZWQgY2F0ZWdvcmllcyBkb2VzIG5vdCBjaGFu
Z2UgcHRyYWNlX3Njb3BlLiBLZWVwIHRoZQpleGlzdGluZyBleGVjdXRhYmxlIGNoZWNrIGFuZCB0
aGUgYmVoYXZpb3Igd2hlbiBtZW1mZF9zZWNyZXQgaXMgc2VsZWN0ZWQuCgpBY2tlZC1ieTogRGF2
aWQgSGlsZGVuYnJhbmQgKEFybSkgPGRhdmlkQGtlcm5lbC5vcmc+CkFzc2lzdGVkLWJ5OiBMTE0K
U2lnbmVkLW9mZi1ieTogVGlhbnlpIENoZW4gPGhpQHR5Y2hlbi5jYz4KLS0tCiB0b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9tbS9ydW5fdm10ZXN0cy5zaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbW0v
cnVuX3ZtdGVzdHMuc2gKaW5kZXggOWU2MmFiNGM2Nzc1Li45YmJlZjk0MTBjY2MgMTAwNzU1Ci0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCisrKyBiL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL21tL3J1bl92bXRlc3RzLnNoCkBAIC0zNzAsNyArMzcwLDcgQEAg
Q0FURUdPUlk9InByb2Nlc3NfbWFkdiIgcnVuX3Rlc3QgLi9wcm9jZXNzX21hZHYKIAogQ0FURUdP
Ulk9InZtYV9tZXJnZSIgcnVuX3Rlc3QgLi9tZXJnZQogCi1pZiBbIC14IC4vbWVtZmRfc2VjcmV0
IF0KK2lmIHRlc3Rfc2VsZWN0ZWQgIm1lbWZkX3NlY3JldCIgJiYgWyAteCAuL21lbWZkX3NlY3Jl
dCBdCiB0aGVuCiBpZiBbIC1mIC9wcm9jL3N5cy9rZXJuZWwveWFtYS9wdHJhY2Vfc2NvcGUgXTsg
dGhlbgogCShlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL3lhbWEvcHRyYWNlX3Njb3BlIDI+JjEp
IHwgdGFwX3ByZWZpeAo=
--000000000000b3b768065b0e6fc9--
