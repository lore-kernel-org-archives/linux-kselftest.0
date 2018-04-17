From: shuahkh@osg.samsung.com (Shuah Khan)
Date: Tue, 17 Apr 2018 09:02:36 -0600
Subject: Linux 4.17-rc1 - kernel paging errors running x86 selftests
In-Reply-To: <CA+55aFzmcwNjgvjwyVEeTYmBmdP5Ed+FNZXKJFpWx4g_+F7G1Q@mail.gmail.com>
References: <1dcd116c-9384-6885-2d9e-f620c14bd955@osg.samsung.com>
 <CA+55aFwE1SR87+Xkkmfr+D0Yq3R0HRkdf1GdgScEfXXWN4ba6w@mail.gmail.com>
 <CA+55aFzotCBw7S=dNzyFjZkNqS7MMeKVgUoK6Dgb9gRPV_ywVQ@mail.gmail.com>
 <8c0a94b7-763d-16be-6401-23a3064ee55a@linux.intel.com>
 <CA+55aFx=pwEJQHhab3gW6+qdom=ccFoWoK-aZokmqtPxNqTd8g@mail.gmail.com>
 <CA+55aFwBT7xEKxoVEEgT3vjg960Tpx+CJo+4238P66Q7w-nM-Q@mail.gmail.com>
 <CA+55aFzmcwNjgvjwyVEeTYmBmdP5Ed+FNZXKJFpWx4g_+F7G1Q@mail.gmail.com>
Message-ID: <aff48576-c8ed-ddf6-5c74-ce4b0153f419@osg.samsung.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180417150236.O19F98dbKQp1CI0HJJJftoLrNjSCsBe4oe3PVIw-wZM@z>

On 04/16/2018 12:34 PM, Linus Torvalds wrote:
> On Mon, Apr 16, 2018 at 11:15 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> Ingo/Thomas: I will be just taking this directly, since it's so
>> trivial and obvious and I got cc'd on the discussion.
> 
> .. and I also verified that it actually fixes the problem Shuah
> reported. Not that there really was any question about it, but hey,
> after bisecting it I decided to just test the fix too.

Awesome. Thanks.

-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
