Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3483AE19D;
	Fri,  7 Aug 2026 07:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786087445; cv=none; b=UyBD7S1zSRnpjlMKl2nBZBmTSutgD7Dk+GQq7F7sqsAlBEDG2+WmmoyiEGqajdeDBEyGqzF6kUPVuus9OZEBiMAL5w4LD4Ky+bjE1hlziivZnahXavArpfwixeR4E1rhl2vjhmCrjG1Hct98Se6mHAYok+4CDptPCyMfddGXuFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786087445; c=relaxed/simple;
	bh=+aleDCCvXTmwPBPdFHKzA6RGhkUii/c3JTIYFCe6rLo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=FGXI47PTYhZHmAg+kSP0IXSCa/s0Wm1GbPzgkMx/BsyWqaCHEbinc+WD7BfuUeyMr63q4QTDXfyWbIYGkic9DHumFMeD91QIjFgSX4u8Bpp4Gjiy/sCKYn8J8U0Eli6TgiFLSoiyCMP8GkfMO0qbk4FONlnHW8ON9MniWmqYYcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Jqk31spB; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Jqk31spB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=+aleDCCvXTmwPBPdFHKzA6RGhkUii/c3JTIYFCe6rLo=; b=J
	qk31spB/hL2LKYYCdnrwNDwHJCCw3MVa9MTAonyuhS2EZoRtEw2p7ZDX6USQFywp
	TLfeNit/SLL+qVmqo7FVWk0TEjz8Rr9fR8PpZwegfewLxjPmyHSke8TcYAFRUDJF
	+xfMCy8+pV1u/aVONqAW5cqzOxranfvYiUmX3G3iEQ=
Received: from fuqingshuang$kylinos.cn ( [116.128.244.169] ) by
 ajax-webmail-wmsvr-40-111 (Coremail) ; Fri, 7 Aug 2026 15:23:09 +0800 (CST)
Date: Fri, 7 Aug 2026 15:23:09 +0800 (CST)
From: "Qingshuang Fu" <fuqingshuang@kylinos.cn>
To: "Antonio Quartulli" <antonio@openvpn.net>
Cc: "Sabrina Dubroca" <sd@queasysnail.net>,
	"David S . Miller" <davem@davemloft.net>,
	"Eric Dumazet" <edumazet@google.com>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
	"Shuah Khan" <shuah@kernel.org>, netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re:Re: [PATCH] selftests/net: ovpn: fix socket leak in
 ovpn_socket() error paths
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
Sender: fffsqian@163.com
In-Reply-To: <9f20537c-a737-4bf0-b9b7-d2ce57c5fe11@openvpn.net>
References: <20260807064816.53811-1-fffsqian@163.com>
 <9f20537c-a737-4bf0-b9b7-d2ce57c5fe11@openvpn.net>
X-NTES-SC: AL_Qu2TBPyTuEsj7yGZbekckk4Vhu49Xcq2vvQv34Fec/kEtgr/+wI7dnBNLF/w7+WmMQaIljyUbB9/yuN3QKxGXXJob8at3lJd26qIbV59AA==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <1beb09cf.50c9.19fdb1ab7c8.Coremail.fuqingshuang@kylinos.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:bygvCgD3v7Tdh3VqMcwtAA--.16168W
X-CM-SenderInfo: 5iii21xldqqiywtou0bp/xtbC6h0R22p1h91QKQAA3B
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

QXQgMjAyNi0wOC0wNyAxNTowNzo1MSwgIkFudG9uaW8gUXVhcnR1bGxpIiA8YW50b25pb0BvcGVu
dnBuLm5ldD4gd3JvdGU6Cj5IaSB0aGVyZSwKPgo+T24gMDcvMDgvMjAyNiAwODo0OCwgUWluZ3No
dWFuZyBGdSB3cm90ZToKPj4gRnJvbTogUWluZ3NodWFuZyBGdSA8ZnVxaW5nc2h1YW5nQGt5bGlu
b3MuY24+Cj4+IAo+PiBUaGUgb3Zwbl9zb2NrZXQoKSBmdW5jdGlvbiBjcmVhdGVzIGEgc29ja2V0
IGJ1dCBmYWlscyB0byBjbG9zZSBpdCBvbgo+PiBzZXZlcmFsIGVycm9yIHBhdGhzLCBsZWFkaW5n
IHRvIGEgZmlsZSBkZXNjcmlwdG9yIGxlYWs6Cj4+IAo+PiAxLiBXaGVuIHRoZSBhZGRyZXNzIGZh
bWlseSBpcyBuZWl0aGVyIEFGX0lORVQgbm9yIEFGX0lORVQ2LCB0aGUgc29ja2V0Cj4+ICAgICBp
cyBsZWFrZWQgaW4gdGhlIHN3aXRjaCBkZWZhdWx0IGNhc2UuCj4+IDIuIFdoZW4gc2V0c29ja29w
dCgpIGZvciBTT19SRVVTRUFERFIsIFNPX1JFVVNFUE9SVCwgb3IgU09fTUFSSyBmYWlscywKPj4g
ICAgIHRoZSBzb2NrZXQgaXMgbGVha2VkLgo+PiAzLiBXaGVuIHNldHNvY2tvcHQoKSBmb3IgSVBW
Nl9WNk9OTFkgZmFpbHMsIHRoZSBzb2NrZXQgaXMgbGVha2VkLgo+PiAKPj4gVGhlIGV4aXN0aW5n
IGVycl9zb2NrZXQgbGFiZWwgYWxyZWFkeSBoYW5kbGVzIGNsb3NpbmcgdGhlIHNvY2tldCBmb3IK
Pj4gdGhlIGJpbmQoKSBmYWlsdXJlIHBhdGguIEZpeCBhbGwgb3RoZXIgZXJyb3IgcGF0aHMgdG8g
dXNlIGdvdG8KPj4gZXJyX3NvY2tldCBpbnN0ZWFkIG9mIHJldHVybmluZyBkaXJlY3RseSwgZW5z
dXJpbmcgdGhlIHNvY2tldCBpcwo+PiBwcm9wZXJseSBjbG9zZWQgb24gZXZlcnkgZXJyb3IgcGF0
aC4KPj4gCj4+IEZpeGVzOiA5NTliYzMzMGE0MzkgKCJ0ZXN0aW5nL3NlbGZ0ZXN0czogYWRkIHRl
c3QgdG9vbCBhbmQgc2NyaXB0cyBmb3Igb3ZwbiBtb2R1bGUiKQo+Cj5XZSdkIHJhdGhlciBzZW5k
IGNoYW5nZXMgbGlrZSB0aGlzIHRvIG5ldC1uZXh0LCBzbyBubyBGaXhlcyB0YWcgcmVxdWlyZWQu
Cj4KPj4gU2lnbmVkLW9mZi1ieTogUWluZ3NodWFuZyBGdSA8ZnVxaW5nc2h1YW5nQGt5bGlub3Mu
Y24+Cj4KPlRoaXMgc2FpZCwgd2UgYWxyZWFkeSBoYXZlIGEgcGF0Y2ggcmV3b3JraW5nIHRoaXMg
cGFydCBvZiB0aGUgc2VsZnRlc3QgCj53aXRoLCB3aGljaCBpcyBhbHNvIGFkZHJlc3NpbmcgdGhp
cyBpc3N1ZToKPgo+aHR0cHM6Ly9wYXRjaHdvcmsub3BlbnZwbi5uZXQvcHJvamVjdC9vdnBuL3Bh
dGNoLzIwMjYwNTEyMTQ0MzU4LjQxOTU5OS00LWFAdW5zdGFibGUuY2MvCj4KPkl0IGlzIHBlbmRp
bmcgdG8gYmUgc2VudCB0byBuZXQtbmV4dCBhcyBzb29uIGFzIHdlJ3JlIGZpbmlzaGVkIHdpdGgg
dGhlIAo+Zml4ZXMgaW4gb3VyIHBpcGUuCj4KPlRoYW5rcyBmb3IgeW91ciBjb250cmlidXRpb24g
aW4gYW55IGNhc2UhCj4KPgo+UmVnYXJkcywKPgo+Cj4KPi0tIAo+QW50b25pbyBRdWFydHVsbGkK
Pk9wZW5WUE4gSW5jLgoKSGksCgpUaGFua3MgZm9yIHRoZSBxdWljayByZXBseSBhbmQgdGhlIHBy
b3ZpZGVkIHBhdGNod29yayBsaW5rLgoKSSBzZWUgeW91IGFscmVhZHkgaGF2ZSBhIHBlbmRpbmcg
c2VyaWVzIHRoYXQgcmVzb2x2ZXMgdGhpcyBzb2NrZXQgbGVhayBwcm9ibGVtLCBzbyBJJ2xsIHdp
dGhkcmF3IG15IHBhdGNoIGFuZCB3b24ndCBmb2xsb3cgdXAgb24gdGhpcyBzdWJtaXNzaW9uIGZ1
cnRoZXIuCgpJJ2xsIHRyYWNrIHlvdXIgcGF0Y2ggc2VyaWVzIHRvIHJldmlldyB0aGUgY2hhbmdl
cyBsYXRlci4KCkJlc3QgcmVnYXJkcywKUWluZ3NodWFuZyBGdQoK
