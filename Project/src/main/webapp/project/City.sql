create table City(
cityname varchar2(30) PRIMARY KEY,
cityinfo varchar2(30) not null,
continent varchar2(30) not null,
longitude varchar2(6) not null,
latitude varchar2(6) not null,
info varchar2(700) not null,
volt varchar2(20) not null,
hour varchar2(20) not null,
timedifference varchar2(20) not null
);

drop table City;
select * from City;
update City set col = value where col = value;
insert into City Values('', '', '', '', '', '', 'V', '�ð�', '�ð�'); -- (����(����), ����(�ѱ�), ���, �浵, ����, ����, ��Ʈ, ����ð�, ����)

---------------- �ƽþ� ���� ���� ----------------
-- �ѱ�
insert into City Values('Seoul', '���ѹα� ����', '�ƽþ�(Asia)', '126.7', '37.4', '���ſ� ���簡 �����ϸ� �Ϸ簡 �ٸ��� ���ϴ� ������ �����ϴ� ���� ������ ���Ӵ�. ���� �Ѻ��ǿ��� 600���� ���縦 �״�� �Ȱ� �ִ� �Ƹ��ٿ� ���õ�� ���Ҿ� ���ѹα��� Ʈ���带 �̲������ ������ ��ȭ�� ũ�� ���� ���׵��� �ѷ��� �� �ִ� ������ ���� ���࿡ ����ȭ�� ��Ҵ�.', '220V', '0�ð�', '0�ð�');
insert into City Values('Busan', '���ѹα� �λ�', '�ƽþ�(Asia)', '129', '35', '�츮���� ��2�� ���� �λ걤����. �λ� ��ǥ �������� �ղ����� �ؿ��� �㿡�� ������Ƽ�� �߰��� ������ ���� ȭ���� �غ��� �ȴ�. ��õ��ȭ������ ���� ��⿡ ������, ���� �������� ���ֵǴ� �ƽþ� �ִ� �Ը��� ��ȭ���� �λ걹����ȭ���� �Բ� �λ��� ���������� ��ܺ��� �͵� ����. ������� ��� ���� ��ŭ �԰Ÿ��� ������ �λ��� �������� �ʼ�!', '220V', '0�ð�', '0�ð�');
insert into City Values('Ulleung', '���ѹα� �︪��', '�ƽþ�(Asia)', '130', '37', '���鸸 �� �� �ڿ��� ����� �������� ������ �︪��. �ܿ�ö ������ �پ ���������� �︪���� ���� ����� �������� �� 14m ������ �����ֱ��� ���� ���� ���� �̵��� �߰��� �Ѵ�. ������� ���� �̻� �ϼ� ����鵵 ���� ��µ�, ������ � ���� �źϹ������� �ٴ幰�� ����Ű�� �ڳ�������, �������� ����� ������������ �پ��� ���� ������ �̰������� ��� �� �ִ� Ư���� ���� �׸��̴�. �ڿ��� ���� â���� ������ �� �ѹ� �ٳ�;� �� ������!', '220V', '0�ð�', '0�ð�');
insert into City Values('Jeju', '���ѹα� ���ֵ�', '�ƽþ�(Asia)', '126.6', '33.1', '�� ��ü�� �ϳ��� �Ŵ��� �����ڿ��� ���ֵ�. ���޶���� ������ �λ����� ���� �ؼ������� ���� ��ǥ ��������, �ĵ��� �Ѻ��� �ֻ������� �ٴ� �� ��å���� ��Ӹ� �ؾ��� ���ֿ����� �� �� �ִ� õ���� �ڿ�������� �ղ�����. ��� �Կ����� �˷��� �����ڽ��� ������ ����� �ް� ������ �Ѷ���� �����, ����ġ ���� ���ָ� ��ǥ�ϴ� �����̴�.', '220V', '0�ð�', '0�ð�');
insert into City Values('Incheon', '���ѹα� ��õ', '�ƽþ�(Asia)', '126.9', '37.4', '��¦ ���� �ٴ����� �ŷ����� ��õ������. ������ Ư¡�� �� �̿��Ͽ� ������ �ؾ� ������ ������ �η� �ߴ��� ���̴�. ��ǥ���� �ؾ�������δ� ���ո� �ؼ������� ����� ��ȭ�� �Ÿ��� ������ ���̵� ���� ������, �ѱ� �� ���� �߱��̶� �Ҹ��� ���̳�Ÿ� ��õ �������� �ղ�����. �� �ܿ��� ��õ ��ó�� ���� ���� �������� ������ �־� ���縦 �׸��� ���� �ڽ��� ��ƺ��� �͵� ����.', '220V', '0�ð�', '0�ð�');
-- �Ϻ�
insert into City Values('Tokyo', '�Ϻ� ����', '�ƽþ�(Asia)', '139.4', '35.4', '���쵵�� �Ϻ��� ��ǻ� �������� ȥ�� ���ο� �ִ� ���� �ִ��� ���ñ��� ���� �������� �ٽ� ����, �Ϻ��� ��ġ, ����, ��ȭ, ����, ����, ���, ����, �м��� �߽����̸�, ����, ������ �Բ� ���� 3�� ���� �� �ϳ��� ���Ѵ�.', '110V', '2�ð�', '0�ð�');
insert into City Values('Osaka', '�Ϻ� ����ī', '�ƽþ�(Asia)', '155.5', '34.7', '����ī��� �ϸ� ���Ϻ� �ִ��� ������ ����ī�θ� ��Ī�ϸ�, ���� �� �ٳ�Ծ �ð��� ���� �� �湮�ϰ� ���� ���ö�� �� �� �ֽ��ϴ�. ���� ö(7~8��)�� �ְ� ����� 33.4�� ������ �ѱ��� ���ؼ� �״��� ���� �ʰ�, �ܿ� ö(12��~2��)�� ���� ����� 2.8�������� ������ ���̾ �����̳� �޾��� ���� �湮�ϱ� �����ϴ�.', '110V', '2�ð�', '0�ð�');
insert into City Values('Kyoto', '�Ϻ� ����', '�ƽþ�(Asia)', '135.7', '35.0', '�Ϻ��� �� ��� ���ø� ������ ���丸ŭ �������� �ʾҰ� ���丸ŭ ������ ���ϴ�. �������, �ݰ���, ������ ���� �ֿ� �������̸� �ƶ�þ߸��� �ڿ������ �����ϱ� ���� �湮�ϴ� ����鵵 ����.', '110V', '2�ð�', '0�ð�');
insert into City Values('Hukuoka', '�Ϻ� ������ī', '�ƽþ�(Asia)', '130.3', '33.6', '���ఴ���� ������ī ������ �� �ı⿡ ������ "ä�������ڰ� �ƴ� �������" ������ī�� �̽İ��� õ���̴�. �̽��� �ػ깰�� ǳ���� ��ī�� ���ٴ� ������ �̽İ����� õ���̴�. �Ӹ� �ƴ϶� �ó� ������ ��Ÿ��(���帶��)�� �������� ������������ ������ī ��Ÿ���� ����� ���� �� �ִ�. ��ȣ�� ������ ��ó�� ������ī �� �������� ��å�ϸ� �θ� �踦 ��ȭ��ų �� �ִ�.', '110V', '1�ð�', '0�ð�');
insert into City Values('Sapporo', '�Ϻ� ������', '�ƽþ�(Asia)', '141.2', '43', '�Ҽ��� ������� ���� ������ ������ �ڿ��� �Ƹ��ٿ��� ������ ���̴�. �Ϻ������� �̷�� 4�� �ֿ� ��(Ȫī�̵�, ȥ��, ������, �Խ�) �� �ϳ��� �Ϻ� �Ϻο� ��ġ�� ���̴�.�Ͼ� �ܿ��� ������ ������ �� �ִ� �ܿ￩�൵ �ŷ����̰� ������ ������ ��� �� �ִ� �������൵ ����� �ŷ����� �Ƹ��ٿ� ���̴�.', '110V', '2�ð�', '0�ð�');
insert into City Values('Nagoya', '�Ϻ� ������', '�ƽþ�(Asia)', '136.9', '35.1', '�����ߴ� ����, ����ī�� �Բ� �Ϻ� ��3�� ���÷� �Ҹ��� ��� ������ �߽� ���ô�. �ֱ� ���帶ũ�� �׸���ũ�� ���� �����߸��� Ư���� �ִ� ���ҳ� ������ ����. ���쳪 ����ī���� �� �Ϻ��������� ���� �� �ִ� ���ô�.', '110V', '2�ð�', '0�ð�');
-- �߱�
insert into City Values('Shanghai', '�߱� ������', '�ƽþ�(Asia)', '121.4', '31.2', '�߱��� ��ȭ�� ������ �߽������� �������� ���յ� �ŷ����� ���ô�.', '220V', '2�ð�', '-1�ð�');
insert into City Values('Beijing', '�߱� ����¡', '�ƽþ�(Asia)', '116.4', '39.9', '�߱��� õ������� �Ҹ� ��ŭ ���� ��ü�� �ڹ������� �������� ���ô�.', '220V', '2�ð�', '-1�ð�');
insert into City Values('Guangzhou', '�߱� ������', '�ƽþ�(Asia)', '113.2', '23.1', '�߱����� ����°�� ū �������� ȭ������ �ִ��� �����������ô�.', '220V', '2�ð�', '-1�ð�');
insert into City Values('Qingdao', '�߱� Ī�ٿ�', '�ƽþ�(Asia)', '120.3', '36', '100�� ������ ���ָ� ǰ�� �Ƹ��ٿ� �ؾ� ���ô�.', '220V', '2�ð�', '-1�ð�');
insert into City Values('Harbin', '�߱� �Ͼ��', '�ƽþ�(Asia)', '126.6', '45.7', '�ų� ������ �Ͼ�� ������������ ������ �߱� �ְ��� �ܿ� �޾�����.', '220V', '2�ð�', '-1�ð�');
-- �븸
insert into City Values('Taipei', '�븸 Ÿ������', '�ƽþ�(Asia)', '121.5', '25', 'Ÿ�̺����� �پ��԰� ��ä�ο� ������ �⿬, �Ǹ��� �ڿ�ȯ���� ���� ���ఴ�� ������ ������ Ÿ�̺��̸� �ƽþƿ��� ���� �α� �ִ� ������ �� �ϳ��� ������ش�. Ÿ�̺��̿��� �ް��� �����ٸ� ���ο� �θǽ��� ����ų ���� �ִ� ��ġ�� ���ƾ� �� �������� �������� Ÿ�̺��̿� ����� ���� ������ ��õ ���� ������ ã�ƺ���.', '110V', '3�ð�', '-1�ð�');
insert into City Values('Taichung', '�븸 Ÿ����', '�ƽþ�(Asia)', '120.7', '24.2', '���ΰ� �߽��� �԰Ÿ��� Ȧ�� ���� Ÿ�̿��� �߽��̶�� �ǹ̸� ���� ���ô�', '110V', '3�ð�', '-1�ð�');
insert into City Values('Tainan', '�븸 Ÿ�̳�', '�ƽþ�(Asia)', '120.1', '22.98', 'Ÿ�̺��̷� õ�������� 220�� �Ⱓ Ÿ�̿��� ����. ��ȭ ������ �߽���, ���޽����� �����Ⱑ �������� Ÿ�̳��� ���Ŵٸ� ����, ��õ, ������ ���� �� ��ܺ�����! Ÿ�̳������� Ÿ�̳� ȭ�� �߽��� �� ������ ���� �α� ���Ҹ� �ѷ����� �̰� ������ �ŷ¿� �컶 ����������.', '110V', '3�ð�', '-1�ð�');
insert into City Values('Kaohsiung', '�븸 ������', '�ƽþ�(Asia)', '120.3', '22.61', '�븸 ���ܿ� ��ġ�� �Ŵ� �����̳� �ױ����� ������, Ÿ�̺��̽ÿ� ���� �븸 ��2�� �����̴�. �븸�� �ױ� ������ �� �� �ִ� �������� ������ ����� ġ�� �� �ؾȱ��� �Ƹ��ٿ� ������ ���߰� ������ Ȱ���� �߽���� ���õ� ��ȭ���� ��� ��� �� �ִ� ���̴�.', '110V', '3�ð�', '-1�ð�');
-- ȫ��&��ī��
insert into City Values('Hong Kong', 'ȫ��', '�ƽþ�(Asia)', '114.1', '22.27', '����� ����, ���ſ� ������ ������ �����ϴ� �������� �ŷ��� ���ô�.', '220V', '4�ð�', '-1�ð�');
insert into City Values('Macau', '��ī��', '�ƽþ�(Asia)', '113.5', '22.14', '���׽��� ���蹮ȭ�������� ������ �߱��� Ư����������.', '220V', '4�ð�', '-1�ð�');
---------------- �ƽþ� 22�� ���� �� ----------------
---------------- �ϾƸ޸�ī ���� ���� ----------------
-- �̱�
insert into City Values('Hawaii', '�̱� �Ͽ���', '�ϾƸ޸�ī(North America)', '-157.7', '21.3', '�Ͽ��̴� ���� ��ȭ�� ������ ����� ���� �湮�ص� ���� �޾�����. �� �� ���� ������ ��⸦ ���ϰ� �ʹٸ� �������� ���� ���� 4������ 6�������� �����ĸ� �����ϱ� ���� ���� �ñ� �����̰� ������ �ָ����̶�� ����� 11������ 3�������� ���ϴ� ���� ����. Ư�� ���� ���� ���� �� ������ 11���� ������ ��', '120V', '8�ð�', '-19�ð�');
insert into City Values('Guam', '�̱� ��', '�ϾƸ޸�ī(North America)', '144.8', '13.4', '���� ȯ������ ������ ���� ��¦�̴� ���ϴ�, ����ġ�� ��� ����� �׸� ���� ���� ������ �ְ��� ������ ������ ���Դϴ�. ����, ������ �ٴٿ��� ��� �� �ִ� ȲȦ�� ������ ��� ���ñ� �ٶ��ϴ�. �Ĺ��� �ô� ������ ��ȭ�� ������, �������� �谡 ó������ ������ ���������� ������ ����� 2�� ������� �������� �̸������ 4000���� ���� ��̷ο� ���縦 ������ �ִ� ���� ���� �̾߱⸦ ��� �ֽ��ϴ�.', '120V', '4�ð�', '1�ð�');
insert into City Values('Saipan', '�̱� ������', '�ϾƸ޸�ī(North America)', '145.7', '15.2', '�������� ������翡 �ִ� �ϸ����Ƴ� ������ ���� ū ���̸�, �̱��� �ϸ����Ƴ� ���� ������ �����Դϴ�. �ϱ���, ���� Ž��� ���� ü�����, �ϸ����Ƴ� �������� ���� ũ�� ���ߵ� ���� �����ǿ����� ��� �����մϴ�. �������� Ȳ�� �غ��� ȯ���� ������ ���̺��� ��ǥ�������� ���� �������, ȣ��, ����Ʈ������ ����, ����, ��买�� �����嵵 ����ϴ�.', '120V', '4�ð�', '1�ð�');
insert into City Values('Losangeles', '�̱� �ν���������', '�ϾƸ޸�ī(North America)', '-118.2', '34.0', 'õ�� ���� ���� ����, ����������� �����ϴ� Ư�� �ִ� ���׷� ������ �ν����������� ������. ���� ���� �͵��� ���Ӿ��� �Ͼ�� �ν����������� ��� Ž���ϰ� �Ͱ� ����� �����Դϴ�.', '120V', '11�ð�', '-16�ð�');
insert into City Values('Newyork', '�̱� ����', '�ϾƸ޸�ī(North America)', '-74', '40.7', '�� ���迡�� ���� Ʈ������ ����. �����ڵ��� �θ��� ��븦 120% �������� �ִ� ������ õ��.������ ������ �뱤�ζ� �� ��ŭ �� ���� �̹��ڵ��� ���̴� ���̴�. �پ��� ������ ���̴� ��ŭ ���� ���� �ȿ� ���� ������ ��Ȱ���, ���ĵ��� �״�� ��� �ְ� �̷��� �پ缺���� ���ô� �׻� Ȱ������ ���� �ִ�.', '120V', '14�ð�', '-13�ð�');
insert into City Values('Sanfrancisco', '�̱� �������ý���', '�ϾƸ޸�ī(North America)', '-122.4', '37.8', '�������ý��ڴ� ���� ���÷� ������, ����� �� �߷� ������ ���۵Ǹ� ����ȸ�� ���Ҿ� ���� �ݸ� ���׽�Ʈ�� ���� �ü��� ���ϴ�. ���Ͼ� ��������� �뽺 ��ġ�� ����Ÿ�����, ������̸� �� ������ ȣ����� �ڱ��ϴ� ���װ� ��Ÿ���ϴ�. ��Ư�ϰ� â�����̸� �ŷ��� ��ġ�� �������ý��ڸ� ���� �����غ�����.', '120V', '10�ð�', '-16�ð�');
insert into City Values('Las Vegas', '�̱� �󽺺��̰Ž�', '�ϾƸ޸�ī(North America)', '-122.1', '37.75', '�縷 ���� ������ ���� ���� ���ô�. �Ϲ������� �󽺺��̰Ž��� �����ϱ� ������ ���ô�. ī������ ��� ���迡�� ���� ������ ī���뿡 ���Ѵٰ� �Ѵ�. �׷��� �濡 ����ڵ��̳� �����ϴ� ������� �����Ƿ� �׷� ������� �����ϴ� �� ����. �ٿ�Ÿ�� ��ó�� ġ���� ���� �����Ƿ� ������ �̿��� ������ �幮 ������ ���� �ʴ� �� ����.', '120V', '11�ð�', '-16�ð�');
insert into City Values('Chicago', '�̱� ��ī��', '�ϾƸ޸�ī(North America)', '-87.6', '41.87', '�پ��� ���� ����, ǳ���� �̽��� ��� �� �ִ� �̱����� 3��°�� ū ���ô�.', '120V', '13�ð�', '-14�ð�');
insert into City Values('Seattle', '�̱� �þ�Ʋ', '�ϾƸ޸�ī(North America)', '-122.3', '47.6', 'ȣ���� ���� ���� �ٴٸ� ������ �ڿ�ģȭ���� �������� ������ ����� ���簡 �� �ִ� ���̴�.', '120V', '10�ð�', '-16�ð�');
insert into City Values('San Diego', '�̱� �����̰�', '�ϾƸ޸�ī(North America)', '-117.1', '32.7', '�� �� ���� �����ϰ� ��ȭ�� ������ �ڶ��ϴ� ��ȭ�ο� ���ô�.', '120V', '14�ð�', '-16�ð�');
-- ĳ����
insert into City Values('Niagara Falls', '���̾ư��� ���� ��Ƽ', '�ϾƸ޸�ī(North America)', '-79.06', '43.1', '����信�� 128km ������ ���̾ư��� ������ �̸� ȣ��(Lake Erie)���� ��Ÿ���� ȣ��(Lake Ontario)�� �帣�� ���̾ư��� ���� �߰��� �ִ�.', '120V', '13�ð�', '-13�ð�');
insert into City Values('Victoria', 'ĳ���� ���丮��', '�ϾƸ޸�ī(North America)', '-123.3', '48.42', 'ĳ���ٿ��� ������ ���� ��ȭ�� ����. �� ������ ���� �����ڵ��� �� ��� ������ �����ϴ�', '120V', '12�ð�', '-5�ð�');
insert into City Values('Quebec City', 'ĳ���� ����', '�ϾƸ޸�ī(North America)', '-71.23', '46.82	', 'ĳ���� ���ο� �ִ� ��. ĳ���ٿ��� ���� ���� ���̸�, ĳ���ٿ��� ��Ÿ���� �������� �α��� ���� ���̴�.��Ÿ����>����>�긮Ƽ�� �÷���� ��. ���������� ��� �켼�� �ٸ� �ֿ� �޸� �Ҿ� ȭ�ڰ� ���� �����̴�. ���ζ� �� �Ϸ��� ��κ��� �α��� ������ ������ �������� �ö󰡸� ���ε� ���� �̷����̵��̳� ũ�� ������ ���� ��� �ְ�, �ֺϴ� ������ �̴���Ʈ�� �����Ѵ�. ', '120V', '16�ð�', '-13�ð�');
insert into City Values('Ottawa', 'ĳ���� ��Ÿ��', '�ϾƸ޸�ī(North America)', '-75.69', '45.42', 'ĳ������ ġ�� ������ Ÿ �Ϲ��� ���õ鿡 ���� ������ ���̴�. Ư�� ������ ��Ÿ�ʹ� ���α���� ��������� �� �ִ� ������ ġ���� �ſ� �����ϴ�. ������ ���� ���θ����� �Ҹ�ġ�� ���� ����ϰ� �߻��ϹǷ� �����ؾ� �Ѵ�.', '120V', '15�ð�', '-13�ð�');
insert into City Values('Vancouver', 'ĳ���� ������', '�ϾƸ޸�ī(North America)', '-123.1', '49.25', 'ĳ���� ���� BC �ֿ��� ���� ū ������ �������� �ų� ���迡�� ��� ���� ���� �������� 5�� �ȿ� �ղ����� �α� �����̴�. �پ��� ������ ��ȭ�� �����ϴ� ���������� �����ϸ� ��ȸ ���ݿ� �پ��� ������ ������ �ִ�. �ѱ��� ĳ������ �� ���ʷ� ���� ����ǿ��� ����� ���� ��ƾ�� �������ε� �����ϴ�. ���� �ѱ��ε��� �������� ��ٰ� �ϸ� ���� �������� ��Ʋ� ���ϴ� ���̴�. ������, ����Ʋ��, ������Ʈ�ν���, ����, �Ḯ ���� ���������� �ֺ� ���õ��� ���ļ� ���� ��������� ���´´�.', '120V', '10�ð�', '-16�ð�');
insert into City Values('Toronto', 'ĳ���� �����', '�ϾƸ޸�ī(North America)', '-79.4', '43.65', '������ ��Ÿ���� ���� �ֵ���. ĳ���ٿ��� ���� ū �����̸� �α��� ���� ĳ���� �ۿ��� ����� �̹��ڰ�, 200������ ������ 130������ ���� �������� ����Ѵ�.', '120V', '13�ð�', '-13�ð�');
insert into City Values('Montreal', 'ĳ���� ��Ʈ����', '�ϾƸ޸�ī(North America)', '-73.6', '45.5', 'ĳ���ٿ��� �� ��°�� ū ���÷� ��������� �����̴�. �ϾƸ޸�ī�� �ĸ��� �Ҹ��� ����.', '120V', '15�ð�', '-13�ð�');
---------------- �ϾƸ޸�ī 17�� ���� �� ----------------
---------------- ���� ���� ���� ----------------
-- ������
insert into City Values('London', '���� ����', '����(Europe)', '-0.12', '51.5', '�������� ���� ž, ť �ո��Ĺ���, ����Ʈ�ν��� ����� ����Ʈ ������ �������� �̷���� ����Ʈ�ν��� ����, �׸���ġ õ����, ���� �ڿ���, �浵 0��, �׸���ġ ��ս� ���� �ִ� �׸���ġ ������ �� �� ���� ���������� �ִ�. �� �� ���� �ڹ���, ������, ������, ü���ü�, ��ȭȸ���� �ִµ�, �뿵 �ڹ���, ���ų� ������, ����Ʈ ���, �뿵 ������, ����Ʈ���尡 ��ǥ���̴�. ���� ����ö�� ���� �������� ���� ������ ö�����̴�.', '240V', '12�ð�', '-8�ð�');
insert into City Values('Paris', '������ �ĸ�', '����(Europe)', '2.35', '48.85', '�ĸ��� �������� ���á�, ������ ���á���� �Ҹ��¸�ŭ �� ��ȭ�� ������ ���迡 �����ϰ� ������, �� ��� ���� �ְ��� ���� ���÷� �λ��ߴ�. �� ������ 1989�� ���� ��ȭ ������ �����Ǿ���. �ų� �� 4,500�� ���� �������� ��ġ�ϰ�, �� 60%�� �ܱ����� �� ������̴�.', '220V', '12�ð�', '-7�ð�');
insert into City Values('Nice', '������ �Ͻ�', '����(Europe)', '7.26', '43.7', '��Ʈ ���㸣 ������ �ֵ��� �Ͻ��� �������� �޾����� �������� �پ����� �����Ѵ�. �����ؿ� ���� ���̿� �ΰ� ������, ��Ż���� ���濡�� �Ұ� �� ų�� ������ ��ġ���� ������ ���ϰ� �ִ�. ���� ���� ���� ��ȭ�� ���Ŀ� �޻�, �غ��� �پ��� ǳ������ ȭ���� ������ �ڶ��Ѵ�. ����, ��ȭ, ����, ����, �ڿ�, �̽��� ��ǥ ������ �Ͻ��� �پ��� �ŷ��� �����ϴ� ������ �ŷ��� ���� �ȷ�Ʈ�� ���� ���̴�.', '220V', '14�ð�', '-7�ð�');
-- ������
insert into City Values('Barcelona', '������ �ٸ����γ�', '����(Europe)', '2.17', '41.38', '������� �������� ������ ������ �߽�. �ٸ����γ��� ���������� �ٴٰ� ���̴� �ϸ��� ��鿡 �ڸ���� �ִ�. �� ������ ���ҽ� ���� ��극��Ʈ �� ���̿� �ִ� ����� �������� ������ �ѷ��ο� ���İ� ��ȭ�ϰ� �����ϴ�.', '220V', '13�ð�', '-7�ð�');
insert into City Values('Madrid', '������ ���帮��', '����(Europe)', '-3.7', '40.41', '������ ���� ���帮�忡�� ��� �� �ִ� �پ��� ����, ����, ����, �м�, ����Ʈ�������� ���̶���Ʈ ��, �� ���ÿ��� �������� ���� �Ǹ��� ������ �� ���� �̼� �÷����� ������ �ڹ����� �̼������� ������ �־��. ������ �߿� ���忡�� 18����� �Ž��� �ö󰡴� ���縦 ���� �پ��� ���ڸ� ��Ÿ���� �ǹ�, ��Ư�� ������, ������ ����鵵 �����ϴ�.', '220V', '13�ð�', '-7�ð�');
insert into City Values('Roma', '��Ż���� �θ�', '����(Europe)', '12.48', '41.9', '�θ��� �������̰� �������� ���̷ο��� �����ϱ� ������ ���Ÿ��� ������ �ʴ� ���Դϴ�. �θ�ó�� ���������� ���� �������� ������ �ƿ츥 ���ô� �θ� �̿ܿ��� ������, ��� ���� ����ִ� ���縦 ������ �� �ֽ��ϴ�.', '220V', '	12�ð�', '-7�ð�');
insert into City Values('Napoli', '��Ż���� ������', '����(Europe)', '14.24', '40.83', 'Ȱ���� �Ÿ��� ���� �����ǰ� ������ ������ �ǹ���� ������ �̷�� �������� �θ�ƽ�� ������ ������ ���迡 ���⸦ �Ҿ�־� �ݴϴ�. ������ �������� �׶���Ƽ�� ���� ���� �ǹ����� �� �� ������ ������� ģ���ϰ� �������� �о��. ���� ��ġ�� �����ϱ� �����ϴ� Ŀ���̶�� ��ġ �ִ� ����� ���� ã�� �� �ְ�, �������� ���ĵ� �Ǹ��ϰ� ���� �ڿ� ������� ���ݸ� ���� ������ �� �ִ� �ؾȿ� �־ �θ�ƽ �������� ������ �ް� �ֽ��ϴ�.', '220V', '15�ð�', '-7�ð�');
insert into City Values('Venice', '��Ż���� ���Ͻ�', '����(Europe)', '12.33', '45.43', '���Ͻ��� ȲȦ�� ���÷� �����ڴ� ���� �ֹ��� Ȧ�� �� ���Ͻ��� ������ �˴ϴ�. ��ȯ���̰� �θ�ƽ�ϸ鼭 �̽��͸��� ������ �����Ⱑ �ɵ��ϴ�. ���� ī�Ϲ��� �� �⿡ �� �� ��������, ī�Ϲ��� ������� �� �� ���� ���ӵ˴ϴ�.', '220V', '13�ð�', '-7�ð�');
insert into City Values('Firenze', '��Ż���� �Ƿ�ü', '����(Europe)', '11.25', '43.76', '�Ƿ�ü�� ���ఴ���� �ŷ��Ű�� ����� ������ ���ȭ�� ������ ��ȭ�� �̷�� ������ ���׻� ��ǰ�� ������ �ڹ��� ��ó���� ����� �������� �������ֽ��ϴ�. �Ƹ��밭�� ����ϳ� ��� �⽾�� ��ġ�� �Ƿ�ü�� �� �κ����� ������ �� ������ ���� �ٸ��� ���� ��Ű���� ���� �־� �� ������ ������ ��� ������ �� �ֽ��ϴ�.', '220V', '15�ð�', '-7�ð�');
insert into City Values('Milano', '��Ż���� �ж��', '����(Europe)', '9.19', '45.46', '�ж��� ��Ż���ƿ��� ���� ���õ� ���� �� �ϳ���, ��Ż������ �ֿ� �м� �귣�� ���簡 �ִ� ���̱⵵ �ϸ� �� ��� ���� ���� �� ������ �� �� �ִ� �ֻ��� ��Ҵ� ���迡�� ���� ������ ���θ� �� �ϳ��� �������� ���丮�� ���������� 2���Դϴ�. ���� ������ ���帶ũ���� ���� ǳ���� ����, ����, ��ȭ�� �� �� �ִ� �Ǹ��� ��Ż���� ���� �� �ϳ��Դϴ�.', '220V', '12�ð�', '-7�ð�');
-- �ߺ�����
insert into City Values('Berlin', '���� ������', '����(Europe)', '13.38', '52.51', '�������� ������ ���� ��¡���� ���� �� �ϳ��Դϴ�. 12���⿡ ������ ������ ������ �� �ݵ��� ���縦 ���ϰ� ������, ������ ��â��, ���, ��ȭ�� ��ȭ�� �������� ���ð� �Ǿ����ϴ�. 1990�� ���ϵ� �������� �ڶ������� �������� ������ �� �����ϰ� �־ ���� ���� �ŷ����� �������� �����ϴ�.', '220V', '11�ð�', '-7�ð�');
insert into City Values('Frankfurt', '���� ����ũǪ��Ʈ', '����(Europe)', '14.55', '52.34', '����ũǪ��Ʈ��� �̸��� �����, �Ը������� �� �ٱ��� ����ũ���� �� ���ÿ� ���� ��� �Ǹ鼭, ����ũ���� ��ζ�� ���� �����ߴٰ� �Ѵ�. ����ũǪ��Ʈ�� ���� �������� ����, ���� �߽ɵ��÷� �����Ͽ���, ���Ͽ��� 5��° �뵵���̴�. �������� �Ը��� �ڶ�ȸ�δ� ������ ������ ���ͼ�� �����ڶ�ȸ�� �����ϴ�.', '220V', '11�ð�', '-7�ð�');
insert into City Values('Hamburc', '���� �Ժθ�ũ', '����(Europe)', '10', '53.54', '�Ժθ�ũ���� ���� �̼����� 19���� ���� ����� �����̴� Ȱ���� �ֺ� ���� �� ���Ÿ��� ǳ���� ���Դϴ�. ���� ��Ʋ���� 1960��뿡 ó������ �⼼���� �� ȫ��� �� �����մϴ�. �� �Ÿ����� �� ��¡���� �긮Ƽ�� �Ϲ���� �����Ϳ� ���ǰ���� ��ĵ� �ٵ��� ������, ī�ٷ� ����� ȣ����� �ҷ�����Ű�� ����ƽ �̼����� �ֽ��ϴ�.', '220V', '14�ð�', '-7�ð�');
insert into City Values('Munich', '���� ����', '����(Europe)', '11.57', '48.13', '������ ���� ���ο� �ִ� ���̿��� ���� �ִ뵵���̰� ���Ͽ��� ������, �Ժθ�ũ ���� ����°�����Դϴ�. ���� �� ����� �� ���� ������ �ǹ��� ������ �ǹ����� ��ȭ�� �̷�� �ִ� ���Դϴ�. �������� ����3�������� �������� ������佺Ʈ�� ������ �� �Դϴ�.', '230V', '12�ð�', '-7�ð�');
insert into City Values('Zurich', '������ �븮��', '����(Europe)', '8.54', '47.37', 'ȣ���� �뵵�� �븮������ ũ������Ƽ���� ���� �����Ⱑ ������ �ڿ��� �Բ� ��췯�� �ִ�. �� �� ���� ���� ���� ��ä�ο� �ڹ���, �븮������ Ǫ�� �佺Ƽ��, ���������� ���� ���� ��ġ�� ����Ʈ�������� �㳷 ���� Ȱ�����̴�. �޽İ� �޾��� ���Ѵٸ� ������ ���� �� �ð� ���� �Ÿ��� �ִ�.', '230V', '12�ð�', '-7�ð�');
insert into City Values('Bern', '������ ����', '����(Europe)', '7.45', '46.94', '�������� ������ ������ŭ ���� ������ ���ø� ���� �״�� ������ ���� �幰 ���̴�. �Ƹ��ٿ� ���ð��� 1983�⿡ ���׽��� ������������ �����Ǿ�����, �� ���� ������ ��� ���� ���ϰ� ������ ��� �� �ִ� 6km�� �̸��� �����̵�� ���� ������ ���̸� �ڶ��Ѵ�. �Ŀ� Ŭ�� ���ʹ� ������ ����� ���� ȭ�� �Ŀ� Ŭ���� ��ǰ�� ��� �����ϰ� �ִ�.', '230V', '14�ð�', '-7�ð�');
insert into City Values('Interlaken', '������ ���Ͷ���', '����(Europe)', '7.85', '46.68', '���Ͷ����� �������� ������Ʈ ������ �� ȣ���� �긮���� ȣ�� ���� ����� ����� �ڸ��� �ִ�. �� �޾����� �� ���� ������ ���츮, ���̰�, ����, ������찡 �⸷�� ������ �����ϸ�, �� ���� ��Ƽ��Ƽ�� ���� ������� �α��.', '230V', '14�ð�', '-7�ð�');
insert into City Values('Geneva', '������ ���׹�', '����(Europe)', '6.14', '46.2', '������ ���츮��� ���� ������ �ϸ��� ��� ���̿� �ڸ�����, �Ҿ�� ���� ���׹ٴ� ���׹� ȣ���� �귯 ���� �� �� ���� �ڸ��Ѵ�. ������ �ΰ����� ����� �������� ������ ���밡 �ִ� ���׹ٴ� UNO ���� ���ΰ� ��ġ�� ���̸�, ���� �������� ��û�� �ִ� ��ȭ�� ���÷ε� �θ� �˷��� �ִ�.', '230V', '14�ð�', '-7�ð�');
insert into City Values('Basel', '������ ����', '����(Europe)', '7.58', '47.55', '������ 40�� ���� ���� ������ �ִ� ������ ������ ���� ���� �ڹ��� �е��� ���� ��ȭ ��ȣ������ ���� ���ô�. �پ��� ��ȭ�Ӹ� �ƴ϶� �޽�ó�� �����ϴ� ���� ���� �帣�� �Ƹ��ٿ� ���ð��� �������� ���๰�� �����Ѵ�.', '230V', '15�ð�', '-7�ð�');
---------------- ���� 19�� ���� �� ----------------