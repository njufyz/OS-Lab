
uMain.elf:     file format elf32-i386


Disassembly of section .text:

00000000 <uEntry>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 14             	sub    $0x14,%esp
   6:	68 98 05 00 00       	push   $0x598
   b:	e8 e0 02 00 00       	call   2f0 <printf>
  10:	c7 04 24 ae 05 00 00 	movl   $0x5ae,(%esp)
  17:	e8 d4 02 00 00       	call   2f0 <printf>
  1c:	c7 04 24 90 06 00 00 	movl   $0x690,(%esp)
  23:	e8 c8 02 00 00       	call   2f0 <printf>
  28:	c7 04 24 cc 06 00 00 	movl   $0x6cc,(%esp)
  2f:	e8 bc 02 00 00       	call   2f0 <printf>
  34:	c7 04 24 00 07 00 00 	movl   $0x700,(%esp)
  3b:	e8 b0 02 00 00       	call   2f0 <printf>
  40:	c7 04 24 7c 07 00 00 	movl   $0x77c,(%esp)
  47:	e8 a4 02 00 00       	call   2f0 <printf>
  4c:	c7 04 24 c5 05 00 00 	movl   $0x5c5,(%esp)
  53:	e8 98 02 00 00       	call   2f0 <printf>
  58:	c7 04 24 a0 07 00 00 	movl   $0x7a0,(%esp)
  5f:	e8 8c 02 00 00       	call   2f0 <printf>
  64:	c7 04 24 90 06 00 00 	movl   $0x690,(%esp)
  6b:	e8 80 02 00 00       	call   2f0 <printf>
  70:	c7 04 24 e3 05 00 00 	movl   $0x5e3,(%esp)
  77:	e8 74 02 00 00       	call   2f0 <printf>
  7c:	c7 04 24 20 08 00 00 	movl   $0x820,(%esp)
  83:	e8 68 02 00 00       	call   2f0 <printf>
  88:	58                   	pop    %eax
  89:	5a                   	pop    %edx
  8a:	68 19 06 00 00       	push   $0x619
  8f:	6a 74                	push   $0x74
  91:	68 f1 05 00 00       	push   $0x5f1
  96:	68 8e 06 00 00       	push   $0x68e
  9b:	68 f5 05 00 00       	push   $0x5f5
  a0:	68 fc 05 00 00       	push   $0x5fc
  a5:	e8 46 02 00 00       	call   2f0 <printf>
  aa:	83 c4 18             	add    $0x18,%esp
  ad:	6a 62                	push   $0x62
  af:	6a 61                	push   $0x61
  b1:	6a 6c                	push   $0x6c
  b3:	6a 53                	push   $0x53
  b5:	6a 4f                	push   $0x4f
  b7:	68 0e 06 00 00       	push   $0x60e
  bc:	e8 2f 02 00 00       	call   2f0 <printf>
  c1:	83 c4 1c             	add    $0x1c,%esp
  c4:	68 00 00 10 00       	push   $0x100000
  c9:	68 5c 08 00 00       	push   $0x85c
  ce:	68 00 00 10 00       	push   $0x100000
  d3:	68 94 08 00 00       	push   $0x894
  d8:	68 1b 06 00 00       	push   $0x61b
  dd:	68 24 06 00 00       	push   $0x624
  e2:	68 c4 08 00 00       	push   $0x8c4
  e7:	e8 04 02 00 00       	call   2f0 <printf>
  ec:	83 c4 14             	add    $0x14,%esp
  ef:	68 7c 07 00 00       	push   $0x77c
  f4:	e8 f7 01 00 00       	call   2f0 <printf>
  f9:	c7 04 24 c5 05 00 00 	movl   $0x5c5,(%esp)
 100:	e8 eb 01 00 00       	call   2f0 <printf>
 105:	83 c4 0c             	add    $0xc,%esp
 108:	68 18 db 00 00       	push   $0xdb18
 10d:	68 c8 01 00 00       	push   $0x1c8
 112:	6a 7b                	push   $0x7b
 114:	6a 02                	push   $0x2
 116:	6a 01                	push   $0x1
 118:	6a 01                	push   $0x1
 11a:	68 29 06 00 00       	push   $0x629
 11f:	e8 cc 01 00 00       	call   2f0 <printf>
 124:	83 c4 1c             	add    $0x1c,%esp
 127:	68 8e 8e 01 00       	push   $0x18e8e
 12c:	68 00 80 ff ff       	push   $0xffff8000
 131:	68 01 df ce ab       	push   $0xabcedf01
 136:	68 00 00 00 80       	push   $0x80000000
 13b:	6a ff                	push   $0xffffffff
 13d:	6a 00                	push   $0x0
 13f:	68 45 06 00 00       	push   $0x645
 144:	e8 a7 01 00 00       	call   2f0 <printf>
 149:	83 c4 1c             	add    $0x1c,%esp
 14c:	68 8e 8e 01 00       	push   $0x18e8e
 151:	68 00 80 ff ff       	push   $0xffff8000
 156:	68 01 df ce ab       	push   $0xabcedf01
 15b:	68 00 00 00 80       	push   $0x80000000
 160:	6a ff                	push   $0xffffffff
 162:	6a 00                	push   $0x0
 164:	68 5d 06 00 00       	push   $0x65d
 169:	e8 82 01 00 00       	call   2f0 <printf>
 16e:	83 c4 14             	add    $0x14,%esp
 171:	68 20 08 00 00       	push   $0x820
 176:	e8 75 01 00 00       	call   2f0 <printf>
 17b:	c7 04 24 75 06 00 00 	movl   $0x675,(%esp)
 182:	e8 69 01 00 00       	call   2f0 <printf>
 187:	83 c4 10             	add    $0x10,%esp
 18a:	eb fe                	jmp    18a <uEntry+0x18a>

0000018c <itoa>:
 18c:	55                   	push   %ebp
 18d:	89 e5                	mov    %esp,%ebp
 18f:	57                   	push   %edi
 190:	56                   	push   %esi
 191:	53                   	push   %ebx
 192:	83 ec 14             	sub    $0x14,%esp
 195:	89 d3                	mov    %edx,%ebx
 197:	89 4d e0             	mov    %ecx,-0x20(%ebp)
 19a:	85 c0                	test   %eax,%eax
 19c:	74 6e                	je     20c <itoa+0x80>
 19e:	3d 00 00 00 80       	cmp    $0x80000000,%eax
 1a3:	74 7b                	je     220 <itoa+0x94>
 1a5:	8d 7d e4             	lea    -0x1c(%ebp),%edi
 1a8:	be f8 08 00 00       	mov    $0x8f8,%esi
 1ad:	b9 04 00 00 00       	mov    $0x4,%ecx
 1b2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 1b4:	85 c0                	test   %eax,%eax
 1b6:	0f 88 94 00 00 00    	js     250 <itoa+0xc4>
 1bc:	c6 02 00             	movb   $0x0,(%edx)
 1bf:	0f 84 9c 00 00 00    	je     261 <itoa+0xd5>
 1c5:	31 f6                	xor    %esi,%esi
 1c7:	31 c9                	xor    %ecx,%ecx
 1c9:	8d 76 00             	lea    0x0(%esi),%esi
 1cc:	99                   	cltd   
 1cd:	f7 7d e0             	idivl  -0x20(%ebp)
 1d0:	8a 54 15 e4          	mov    -0x1c(%ebp,%edx,1),%dl
 1d4:	88 14 33             	mov    %dl,(%ebx,%esi,1)
 1d7:	46                   	inc    %esi
 1d8:	85 c0                	test   %eax,%eax
 1da:	7f f0                	jg     1cc <itoa+0x40>
 1dc:	89 f0                	mov    %esi,%eax
 1de:	c6 04 33 00          	movb   $0x0,(%ebx,%esi,1)
 1e2:	80 f9 01             	cmp    $0x1,%cl
 1e5:	89 d9                	mov    %ebx,%ecx
 1e7:	83 d9 ff             	sbb    $0xffffffff,%ecx
 1ea:	8d 54 03 ff          	lea    -0x1(%ebx,%eax,1),%edx
 1ee:	39 ca                	cmp    %ecx,%edx
 1f0:	76 10                	jbe    202 <itoa+0x76>
 1f2:	66 90                	xchg   %ax,%ax
 1f4:	8a 01                	mov    (%ecx),%al
 1f6:	8a 1a                	mov    (%edx),%bl
 1f8:	88 19                	mov    %bl,(%ecx)
 1fa:	88 02                	mov    %al,(%edx)
 1fc:	41                   	inc    %ecx
 1fd:	4a                   	dec    %edx
 1fe:	39 d1                	cmp    %edx,%ecx
 200:	72 f2                	jb     1f4 <itoa+0x68>
 202:	89 f0                	mov    %esi,%eax
 204:	83 c4 14             	add    $0x14,%esp
 207:	5b                   	pop    %ebx
 208:	5e                   	pop    %esi
 209:	5f                   	pop    %edi
 20a:	5d                   	pop    %ebp
 20b:	c3                   	ret    
 20c:	c6 02 30             	movb   $0x30,(%edx)
 20f:	c6 42 01 00          	movb   $0x0,0x1(%edx)
 213:	b8 01 00 00 00       	mov    $0x1,%eax
 218:	83 c4 14             	add    $0x14,%esp
 21b:	5b                   	pop    %ebx
 21c:	5e                   	pop    %esi
 21d:	5f                   	pop    %edi
 21e:	5d                   	pop    %ebp
 21f:	c3                   	ret    
 220:	31 c0                	xor    %eax,%eax
 222:	80 3a 00             	cmpb   $0x0,(%edx)
 225:	74 08                	je     22f <itoa+0xa3>
 227:	90                   	nop
 228:	40                   	inc    %eax
 229:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
 22d:	75 f9                	jne    228 <itoa+0x9c>
 22f:	b2 2d                	mov    $0x2d,%dl
 231:	b9 ec 08 00 00       	mov    $0x8ec,%ecx
 236:	29 c1                	sub    %eax,%ecx
 238:	88 14 03             	mov    %dl,(%ebx,%eax,1)
 23b:	40                   	inc    %eax
 23c:	8a 14 01             	mov    (%ecx,%eax,1),%dl
 23f:	84 d2                	test   %dl,%dl
 241:	75 f5                	jne    238 <itoa+0xac>
 243:	b8 0b 00 00 00       	mov    $0xb,%eax
 248:	83 c4 14             	add    $0x14,%esp
 24b:	5b                   	pop    %ebx
 24c:	5e                   	pop    %esi
 24d:	5f                   	pop    %edi
 24e:	5d                   	pop    %ebp
 24f:	c3                   	ret    
 250:	c6 02 2d             	movb   $0x2d,(%edx)
 253:	f7 d8                	neg    %eax
 255:	be 01 00 00 00       	mov    $0x1,%esi
 25a:	b1 01                	mov    $0x1,%cl
 25c:	e9 6b ff ff ff       	jmp    1cc <itoa+0x40>
 261:	89 d1                	mov    %edx,%ecx
 263:	31 f6                	xor    %esi,%esi
 265:	31 c0                	xor    %eax,%eax
 267:	eb 81                	jmp    1ea <itoa+0x5e>
 269:	8d 76 00             	lea    0x0(%esi),%esi

0000026c <strlen>:
 26c:	55                   	push   %ebp
 26d:	89 e5                	mov    %esp,%ebp
 26f:	8b 55 08             	mov    0x8(%ebp),%edx
 272:	31 c0                	xor    %eax,%eax
 274:	80 3a 00             	cmpb   $0x0,(%edx)
 277:	74 0a                	je     283 <strlen+0x17>
 279:	8d 76 00             	lea    0x0(%esi),%esi
 27c:	40                   	inc    %eax
 27d:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 281:	75 f9                	jne    27c <strlen+0x10>
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    
 285:	8d 76 00             	lea    0x0(%esi),%esi

00000288 <strcpy>:
 288:	55                   	push   %ebp
 289:	89 e5                	mov    %esp,%ebp
 28b:	8b 45 0c             	mov    0xc(%ebp),%eax
 28e:	8a 10                	mov    (%eax),%dl
 290:	84 d2                	test   %dl,%dl
 292:	74 0e                	je     2a2 <strcpy+0x1a>
 294:	8b 4d 08             	mov    0x8(%ebp),%ecx
 297:	40                   	inc    %eax
 298:	88 11                	mov    %dl,(%ecx)
 29a:	8a 10                	mov    (%eax),%dl
 29c:	41                   	inc    %ecx
 29d:	40                   	inc    %eax
 29e:	84 d2                	test   %dl,%dl
 2a0:	75 f6                	jne    298 <strcpy+0x10>
 2a2:	5d                   	pop    %ebp
 2a3:	c3                   	ret    

000002a4 <strcat>:
 2a4:	55                   	push   %ebp
 2a5:	89 e5                	mov    %esp,%ebp
 2a7:	53                   	push   %ebx
 2a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
 2ab:	8b 55 0c             	mov    0xc(%ebp),%edx
 2ae:	31 c0                	xor    %eax,%eax
 2b0:	80 3b 00             	cmpb   $0x0,(%ebx)
 2b3:	74 0a                	je     2bf <strcat+0x1b>
 2b5:	8d 76 00             	lea    0x0(%esi),%esi
 2b8:	40                   	inc    %eax
 2b9:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
 2bd:	75 f9                	jne    2b8 <strcat+0x14>
 2bf:	8a 0a                	mov    (%edx),%cl
 2c1:	84 c9                	test   %cl,%cl
 2c3:	74 0d                	je     2d2 <strcat+0x2e>
 2c5:	01 d8                	add    %ebx,%eax
 2c7:	42                   	inc    %edx
 2c8:	88 08                	mov    %cl,(%eax)
 2ca:	8a 0a                	mov    (%edx),%cl
 2cc:	40                   	inc    %eax
 2cd:	42                   	inc    %edx
 2ce:	84 c9                	test   %cl,%cl
 2d0:	75 f6                	jne    2c8 <strcat+0x24>
 2d2:	5b                   	pop    %ebx
 2d3:	5d                   	pop    %ebp
 2d4:	c3                   	ret    
 2d5:	8d 76 00             	lea    0x0(%esi),%esi

000002d8 <syscall>:
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	53                   	push   %ebx
 2dc:	8b 55 14             	mov    0x14(%ebp),%edx
 2df:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2e2:	8b 45 08             	mov    0x8(%ebp),%eax
 2e5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2e8:	cd 80                	int    $0x80
 2ea:	5b                   	pop    %ebx
 2eb:	5d                   	pop    %ebp
 2ec:	c3                   	ret    
 2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <printf>:
 2f0:	55                   	push   %ebp
 2f1:	89 e5                	mov    %esp,%ebp
 2f3:	57                   	push   %edi
 2f4:	56                   	push   %esi
 2f5:	53                   	push   %ebx
 2f6:	81 ec 4c 01 00 00    	sub    $0x14c,%esp
 2fc:	b9 40 00 00 00       	mov    $0x40,%ecx
 301:	31 c0                	xor    %eax,%eax
 303:	8d bd f4 fe ff ff    	lea    -0x10c(%ebp),%edi
 309:	f3 ab                	rep stos %eax,%es:(%edi)
 30b:	8d 45 0c             	lea    0xc(%ebp),%eax
 30e:	89 c6                	mov    %eax,%esi
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	8a 00                	mov    (%eax),%al
 315:	84 c0                	test   %al,%al
 317:	0f 84 6f 01 00 00    	je     48c <printf+0x19c>
 31d:	c7 85 b0 fe ff ff 00 	movl   $0x0,-0x150(%ebp)
 324:	00 00 00 
 327:	8d 9d f4 fe ff ff    	lea    -0x10c(%ebp),%ebx
 32d:	eb 1e                	jmp    34d <printf+0x5d>
 32f:	90                   	nop
 330:	88 03                	mov    %al,(%ebx)
 332:	43                   	inc    %ebx
 333:	ff 85 b0 fe ff ff    	incl   -0x150(%ebp)
 339:	8b 85 b0 fe ff ff    	mov    -0x150(%ebp),%eax
 33f:	8b 7d 08             	mov    0x8(%ebp),%edi
 342:	8a 04 07             	mov    (%edi,%eax,1),%al
 345:	84 c0                	test   %al,%al
 347:	0f 84 3f 01 00 00    	je     48c <printf+0x19c>
 34d:	3c 25                	cmp    $0x25,%al
 34f:	75 df                	jne    330 <printf+0x40>
 351:	ff 85 b0 fe ff ff    	incl   -0x150(%ebp)
 357:	8b 95 b0 fe ff ff    	mov    -0x150(%ebp),%edx
 35d:	b9 21 00 00 00       	mov    $0x21,%ecx
 362:	31 c0                	xor    %eax,%eax
 364:	8d bd d3 fe ff ff    	lea    -0x12d(%ebp),%edi
 36a:	f3 aa                	rep stos %al,%es:(%edi)
 36c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 36f:	8a 14 11             	mov    (%ecx,%edx,1),%dl
 372:	80 fa 64             	cmp    $0x64,%dl
 375:	0f 84 55 01 00 00    	je     4d0 <printf+0x1e0>
 37b:	7f 1b                	jg     398 <printf+0xa8>
 37d:	80 fa 25             	cmp    $0x25,%dl
 380:	74 b1                	je     333 <printf+0x43>
 382:	80 fa 63             	cmp    $0x63,%dl
 385:	0f 85 3d 01 00 00    	jne    4c8 <printf+0x1d8>
 38b:	8b 06                	mov    (%esi),%eax
 38d:	88 03                	mov    %al,(%ebx)
 38f:	83 c6 04             	add    $0x4,%esi
 392:	43                   	inc    %ebx
 393:	eb 9e                	jmp    333 <printf+0x43>
 395:	8d 76 00             	lea    0x0(%esi),%esi
 398:	80 fa 73             	cmp    $0x73,%dl
 39b:	0f 84 7f 01 00 00    	je     520 <printf+0x230>
 3a1:	80 fa 78             	cmp    $0x78,%dl
 3a4:	0f 85 1e 01 00 00    	jne    4c8 <printf+0x1d8>
 3aa:	8d 7e 04             	lea    0x4(%esi),%edi
 3ad:	89 bd ac fe ff ff    	mov    %edi,-0x154(%ebp)
 3b3:	8b 36                	mov    (%esi),%esi
 3b5:	89 b5 a8 fe ff ff    	mov    %esi,-0x158(%ebp)
 3bb:	85 f6                	test   %esi,%esi
 3bd:	0f 89 b1 01 00 00    	jns    574 <printf+0x284>
 3c3:	8d bd ba fe ff ff    	lea    -0x146(%ebp),%edi
 3c9:	b9 09 00 00 00       	mov    $0x9,%ecx
 3ce:	f3 aa                	rep stos %al,%es:(%edi)
 3d0:	8d bd c3 fe ff ff    	lea    -0x13d(%ebp),%edi
 3d6:	be f8 08 00 00       	mov    $0x8f8,%esi
 3db:	b9 04 00 00 00       	mov    $0x4,%ecx
 3e0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 3e2:	8b 85 a8 fe ff ff    	mov    -0x158(%ebp),%eax
 3e8:	89 85 b4 fe ff ff    	mov    %eax,-0x14c(%ebp)
 3ee:	8d b5 b4 fe ff ff    	lea    -0x14c(%ebp),%esi
 3f4:	8d 95 ba fe ff ff    	lea    -0x146(%ebp),%edx
 3fa:	8d bd b0 fe ff ff    	lea    -0x150(%ebp),%edi
 400:	8a 46 03             	mov    0x3(%esi),%al
 403:	88 c1                	mov    %al,%cl
 405:	c0 e9 04             	shr    $0x4,%cl
 408:	0f b6 c9             	movzbl %cl,%ecx
 40b:	8a 8c 0d c3 fe ff ff 	mov    -0x13d(%ebp,%ecx,1),%cl
 412:	88 0a                	mov    %cl,(%edx)
 414:	83 e0 0f             	and    $0xf,%eax
 417:	8a 84 05 c3 fe ff ff 	mov    -0x13d(%ebp,%eax,1),%al
 41e:	88 42 01             	mov    %al,0x1(%edx)
 421:	4e                   	dec    %esi
 422:	83 c2 02             	add    $0x2,%edx
 425:	39 f7                	cmp    %esi,%edi
 427:	75 d7                	jne    400 <printf+0x110>
 429:	8a 8d ba fe ff ff    	mov    -0x146(%ebp),%cl
 42f:	84 c9                	test   %cl,%cl
 431:	74 1e                	je     451 <printf+0x161>
 433:	31 c0                	xor    %eax,%eax
 435:	8d 76 00             	lea    0x0(%esi),%esi
 438:	88 8c 05 d3 fe ff ff 	mov    %cl,-0x12d(%ebp,%eax,1)
 43f:	40                   	inc    %eax
 440:	8a 8c 05 ba fe ff ff 	mov    -0x146(%ebp,%eax,1),%cl
 447:	84 c9                	test   %cl,%cl
 449:	75 ed                	jne    438 <printf+0x148>
 44b:	8a 8d d3 fe ff ff    	mov    -0x12d(%ebp),%cl
 451:	b8 08 00 00 00       	mov    $0x8,%eax
 456:	31 d2                	xor    %edx,%edx
 458:	80 3b 00             	cmpb   $0x0,(%ebx)
 45b:	74 0a                	je     467 <printf+0x177>
 45d:	8d 76 00             	lea    0x0(%esi),%esi
 460:	42                   	inc    %edx
 461:	80 3c 13 00          	cmpb   $0x0,(%ebx,%edx,1)
 465:	75 f9                	jne    460 <printf+0x170>
 467:	84 c9                	test   %cl,%cl
 469:	74 13                	je     47e <printf+0x18e>
 46b:	01 da                	add    %ebx,%edx
 46d:	8d b5 d4 fe ff ff    	lea    -0x12c(%ebp),%esi
 473:	90                   	nop
 474:	88 0a                	mov    %cl,(%edx)
 476:	8a 0e                	mov    (%esi),%cl
 478:	42                   	inc    %edx
 479:	46                   	inc    %esi
 47a:	84 c9                	test   %cl,%cl
 47c:	75 f6                	jne    474 <printf+0x184>
 47e:	01 c3                	add    %eax,%ebx
 480:	8b b5 ac fe ff ff    	mov    -0x154(%ebp),%esi
 486:	e9 a8 fe ff ff       	jmp    333 <printf+0x43>
 48b:	90                   	nop
 48c:	31 c9                	xor    %ecx,%ecx
 48e:	31 d2                	xor    %edx,%edx
 490:	80 bd f4 fe ff ff 00 	cmpb   $0x0,-0x10c(%ebp)
 497:	74 10                	je     4a9 <printf+0x1b9>
 499:	8d 76 00             	lea    0x0(%esi),%esi
 49c:	41                   	inc    %ecx
 49d:	89 ca                	mov    %ecx,%edx
 49f:	80 bc 0d f4 fe ff ff 	cmpb   $0x0,-0x10c(%ebp,%ecx,1)
 4a6:	00 
 4a7:	75 f3                	jne    49c <printf+0x1ac>
 4a9:	bb 01 00 00 00       	mov    $0x1,%ebx
 4ae:	b8 04 00 00 00       	mov    $0x4,%eax
 4b3:	8d 8d f4 fe ff ff    	lea    -0x10c(%ebp),%ecx
 4b9:	cd 80                	int    $0x80
 4bb:	81 c4 4c 01 00 00    	add    $0x14c,%esp
 4c1:	5b                   	pop    %ebx
 4c2:	5e                   	pop    %esi
 4c3:	5f                   	pop    %edi
 4c4:	5d                   	pop    %ebp
 4c5:	c3                   	ret    
 4c6:	66 90                	xchg   %ax,%ax
 4c8:	88 13                	mov    %dl,(%ebx)
 4ca:	43                   	inc    %ebx
 4cb:	e9 63 fe ff ff       	jmp    333 <printf+0x43>
 4d0:	89 f0                	mov    %esi,%eax
 4d2:	83 c6 04             	add    $0x4,%esi
 4d5:	b9 0a 00 00 00       	mov    $0xa,%ecx
 4da:	8d 95 d3 fe ff ff    	lea    -0x12d(%ebp),%edx
 4e0:	8b 00                	mov    (%eax),%eax
 4e2:	e8 a5 fc ff ff       	call   18c <itoa>
 4e7:	31 d2                	xor    %edx,%edx
 4e9:	80 3b 00             	cmpb   $0x0,(%ebx)
 4ec:	74 09                	je     4f7 <printf+0x207>
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	42                   	inc    %edx
 4f1:	80 3c 13 00          	cmpb   $0x0,(%ebx,%edx,1)
 4f5:	75 f9                	jne    4f0 <printf+0x200>
 4f7:	8a 8d d3 fe ff ff    	mov    -0x12d(%ebp),%cl
 4fd:	84 c9                	test   %cl,%cl
 4ff:	74 15                	je     516 <printf+0x226>
 501:	01 da                	add    %ebx,%edx
 503:	8d bd d4 fe ff ff    	lea    -0x12c(%ebp),%edi
 509:	8d 76 00             	lea    0x0(%esi),%esi
 50c:	88 0a                	mov    %cl,(%edx)
 50e:	8a 0f                	mov    (%edi),%cl
 510:	42                   	inc    %edx
 511:	47                   	inc    %edi
 512:	84 c9                	test   %cl,%cl
 514:	75 f6                	jne    50c <printf+0x21c>
 516:	01 c3                	add    %eax,%ebx
 518:	e9 16 fe ff ff       	jmp    333 <printf+0x43>
 51d:	8d 76 00             	lea    0x0(%esi),%esi
 520:	8d 46 04             	lea    0x4(%esi),%eax
 523:	89 85 ac fe ff ff    	mov    %eax,-0x154(%ebp)
 529:	8b 0e                	mov    (%esi),%ecx
 52b:	31 c0                	xor    %eax,%eax
 52d:	80 3b 00             	cmpb   $0x0,(%ebx)
 530:	74 09                	je     53b <printf+0x24b>
 532:	66 90                	xchg   %ax,%ax
 534:	40                   	inc    %eax
 535:	80 3c 03 00          	cmpb   $0x0,(%ebx,%eax,1)
 539:	75 f9                	jne    534 <printf+0x244>
 53b:	8a 11                	mov    (%ecx),%dl
 53d:	84 d2                	test   %dl,%dl
 53f:	74 50                	je     591 <printf+0x2a1>
 541:	01 d8                	add    %ebx,%eax
 543:	8d 79 01             	lea    0x1(%ecx),%edi
 546:	66 90                	xchg   %ax,%ax
 548:	88 10                	mov    %dl,(%eax)
 54a:	8a 17                	mov    (%edi),%dl
 54c:	40                   	inc    %eax
 54d:	47                   	inc    %edi
 54e:	84 d2                	test   %dl,%dl
 550:	75 f6                	jne    548 <printf+0x258>
 552:	80 39 00             	cmpb   $0x0,(%ecx)
 555:	74 3a                	je     591 <printf+0x2a1>
 557:	31 c0                	xor    %eax,%eax
 559:	8d 76 00             	lea    0x0(%esi),%esi
 55c:	40                   	inc    %eax
 55d:	89 c6                	mov    %eax,%esi
 55f:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
 563:	75 f7                	jne    55c <printf+0x26c>
 565:	01 f3                	add    %esi,%ebx
 567:	8b b5 ac fe ff ff    	mov    -0x154(%ebp),%esi
 56d:	e9 c1 fd ff ff       	jmp    333 <printf+0x43>
 572:	66 90                	xchg   %ax,%ax
 574:	b9 10 00 00 00       	mov    $0x10,%ecx
 579:	8d 95 d3 fe ff ff    	lea    -0x12d(%ebp),%edx
 57f:	89 f0                	mov    %esi,%eax
 581:	e8 06 fc ff ff       	call   18c <itoa>
 586:	8a 8d d3 fe ff ff    	mov    -0x12d(%ebp),%cl
 58c:	e9 c5 fe ff ff       	jmp    456 <printf+0x166>
 591:	31 f6                	xor    %esi,%esi
 593:	eb d0                	jmp    565 <printf+0x275>
