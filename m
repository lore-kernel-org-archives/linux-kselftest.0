Received: from sender-of-o55.zoho.eu (sender-of-o55.zoho.eu [136.143.169.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54DC282F15;
	Sat, 21 Mar 2026 12:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774096641; cv=pass; b=VV5qlwfTnwRU3G4/Vn+A/4/83vcTh/2yJpmobM0UrTiHpC9I3EJGmikP8ow3UiUYXsvMfMWtr+0NTuwv61pW3ZlzOs0+aXzHl+5cyeWBgTIgGmr+OHoS9m5CTouUF29LZNeaojdnSmffrpkG2jVSzp6/k38bBxiTR38UXqgNt2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774096641; c=relaxed/simple;
	bh=cLuHTZNdKCFy1GxnY0S4y5nOTyWIGUh2GZ/RPM1MRbc=;
	h=subject:from:to:cc:Message-ID:date:mime-version:content-type; b=Sf0yaXad4plAQqPiroGIcYK6Yr3xTOQJ84qBgX5QTJCWIcEj6vvlV74A0nSq6IreH0ghBGArJC1+DRnbOZCmpVZAkdwURGS1LCiduUSr7cstpCCsa+6VEftlG31NTw5khOSuUiyAp3gWRCgIXhE6BCbueErCw3r6HidTIKCNvHM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org; spf=pass smtp.mailfrom=objecting.org; dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b=biXmq/9X; arc=pass smtp.client-ip=136.143.169.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=objecting.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=objecting.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=objecting.org header.i=objecting@objecting.org header.b="biXmq/9X"
ARC-Seal: i=1; a=rsa-sha256; t=1774096628; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=ZFJkfD8A6DkCIAQSd6gTS9+PucgEoh9ps6PxE+mN94DOZfdcR3Ybhdm7f/WuuSQs9joLqf7z48MuFFc78XB47qGmp+zmNyOEXX+U0WyGDzXB8KStNPUrGieEJGNQ+SejYbNcq8uY0a+oSuae+5ATR/HlHXGI9dgSt2EB12QBhI8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1774096628; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cLuHTZNdKCFy1GxnY0S4y5nOTyWIGUh2GZ/RPM1MRbc=; 
	b=SZjP14dRN2+3xtALWVaRPL2qiVgNFPlyEZ+qexnR5EaqehCbSmsy/zVBJyg+3d71GO7BuRwbMEyVwv6fYzGhr6gfgP2nPIqpJgxpLRI3nDEfEfToMrVcKsmww23UJiHsNIGycpYu2vxKe0jh6u2R/JbSdO2XlzJ/qbJo/VIuIxs=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=objecting.org;
	spf=pass  smtp.mailfrom=objecting@objecting.org;
	dmarc=pass header.from=<objecting@objecting.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774096628;
	s=zmail; d=objecting.org; i=objecting@objecting.org;
	h=subject:from:to:cc:Message-ID:date:mime-version:content-type:content-transfer-encoding:Date:From:Message-Id:Reply-To:Subject:To:Cc;
	bh=cLuHTZNdKCFy1GxnY0S4y5nOTyWIGUh2GZ/RPM1MRbc=;
	b=biXmq/9XWuBko2hFR/ZnqVAUhVoELJrScXTENuAX9JAVszt5ZEd+2oCSYtcNoKaH
	srZxk5OWBaaako//DZWut5kn0y8LvsWWpq0M8N/WbC4+JpOPxawlr+ntfaFzr6grAR9
	2uy8byHbhqzuqHX55N8/3EDzGXGb2bbTq/WCFuVg=
Received: by mx.zoho.eu with SMTPS id 1774096625585343.90074524897466;
	Sat, 21 Mar 2026 13:37:05 +0100 (CET)
subject: Re: [PATCH] lib/test_module: use pr_info instead of pr_warn for non-warning messages
from: Josh Law <objecting@objecting.org>
to: objecting@objecting.org
cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 keescook@chromium.org
Message-ID: <19d10662fb4.373ac74a-1152270506.-6653864247094956025@zoho.eu>
date: Sat, 21 Mar 2026 12:37:06 +0000
x-mailer: Dart Mailer library
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
mime-version: 1.0
content-type: text/plain; charset=utf-8
content-transfer-encoding: base64
X-ZohoMailClient: External

T24gMjAyNi0wMy0yMSwgb2JqZWN0aW5nQG9iamVjdGluZy5vcmcgd3JvdGU6DQo+IEZyb20gYzM0
ODI0MDc4OGMwYzMyNTM3MjI2ZjZiMzRhOTQyZmMwZmRhYTQzOCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDENCj4gRnJvbTogVGVzdCBEZXZlbG9wZXIgPHRlc3RAZXhhbXBsZS5jb20+DQo+IERhdGU6
IFNhdCwgMjEgTWFyIDIwMjYgMTI6Mjc6MjEgKzAwMDANCj4gU3ViamVjdDogW1BBVENIXSBsaWIv
dGVzdF9tb2R1bGU6IHVzZSBwcl9pbmZvIGluc3RlYWQgb2YgcHJfd2FybiBmb3INCj4gIG5vbi13
YXJuaW5nIG1lc3NhZ2VzDQo+IA0KPiBUaGUgdGVzdCBtb2R1bGUgdXNlcyBwcl93YXJuKCkgZm9y
IGl0cyBpbml0IGFuZCBleGl0IG1lc3NhZ2VzLCBidXQgdGhlc2UNCj4gYXJlIGluZm9ybWF0aW9u
YWwgaW4gbmF0dXJlIHJhdGhlciB0aGFuIGFjdHVhbCB3YXJuaW5ncy4gVXNpbmcgcHJfd2Fybigp
DQo+IGZvciBub24td2FybmluZyBtZXNzYWdlcyBjbHV0dGVycyB0aGUga2VybmVsIGxvZyB3aXRo
IGZhbHNlIHBvc2l0aXZlcw0KPiB3aGVuIHNjYW5uaW5nIGZvciByZWFsIHdhcm5pbmdzLg0KPiAN
Cj4gUmVwbGFjZSBwcl93YXJuKCkgd2l0aCBwcl9pbmZvKCkgdG8gbW9yZSBhY2N1cmF0ZWx5IHJl
ZmxlY3QgdGhlIHNldmVyaXR5DQo+IGxldmVsIG9mIHRoZXNlIG1lc3NhZ2VzLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogVGVzdCBEZXZlbG9wZXIgPHRlc3RAZXhhbXBsZS5jb20+DQo+IFNpZ25lZC1v
ZmYtYnk6IEpvc2ggTGF3IDxvYmplY3RpbmdAb2JqZWN0aW5nLm9yZz4NCj4gLS0tDQo+ICBsaWIv
dGVzdF9tb2R1bGUuYyB8IDQgKystLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvdGVzdF9tb2R1bGUuYyBi
L2xpYi90ZXN0X21vZHVsZS5jDQo+IGluZGV4IDNkMWIyOWI3NDgwNy4uMGRkY2EwODYzODEzIDEw
MDY0NA0KPiAtLS0gYS9saWIvdGVzdF9tb2R1bGUuYw0KPiArKysgYi9saWIvdGVzdF9tb2R1bGUu
Yw0KPiBAQCAtMTYsNyArMTYsNyBAQA0KPiAgDQo+ICBzdGF0aWMgaW50IF9faW5pdCB0ZXN0X21v
ZHVsZV9pbml0KHZvaWQpDQo+ICB7DQo+IC0JcHJfd2FybigiSGVsbG8sIHdvcmxkXG4iKTsNCj4g
Kwlwcl9pbmZvKCJIZWxsbywgd29ybGRcbiIpOw0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+
IEBAIC0yNSw3ICsyNSw3IEBAIG1vZHVsZV9pbml0KHRlc3RfbW9kdWxlX2luaXQpOw0KPiAgDQo+
ICBzdGF0aWMgdm9pZCBfX2V4aXQgdGVzdF9tb2R1bGVfZXhpdCh2b2lkKQ0KPiAgew0KPiAtCXBy
X3dhcm4oIkdvb2RieWVcbiIpOw0KPiArCXByX2luZm8oIkdvb2RieWVcbiIpOw0KPiAgfQ0KPiAg
DQo+ICBtb2R1bGVfZXhpdCh0ZXN0X21vZHVsZV9leGl0KTsNCj4gLS0gDQo+IDIuMzQuMQ0KPiAN
Cj4gDQoNCg0KKElHTk9SRTogVEVTVCBNRVNTQUdFISkNCg0KVi9SDQoNCg0KSm9zaCBMYXcNCg0K

